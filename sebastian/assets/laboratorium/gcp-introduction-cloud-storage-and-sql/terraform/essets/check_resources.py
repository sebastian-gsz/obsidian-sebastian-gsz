import os
import sys
import json
import subprocess

def run_command(args):
    try:
        # On Windows, shell=True is required to find batch files (.cmd) like gcloud
        res = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
        return res.returncode == 0
    except Exception:
        return False

def get_managed_resources(state_file_path="terraform.tfstate"):
    managed = set()
    if not os.path.exists(state_file_path):
        return managed
    try:
        with open(state_file_path, "r", encoding="utf-8") as f:
            state = json.load(f)
        resources = state.get("resources", [])
        for res in resources:
            if res.get("mode") == "managed":
                module = res.get("module", "")
                res_type = res.get("type", "")
                res_name = res.get("name", "")
                # Create a unique key like "module.vpc.google_compute_network.vpc"
                key = f"{module}.{res_type}.{res_name}" if module else f"{res_type}.{res_name}"
                # Only count it as managed if it has actual instances in the state
                if res.get("instances"):
                    managed.add(key)
    except Exception:
        pass
    return managed

def main():
    try:
        input_data = json.loads(sys.stdin.read())
    except Exception:
        input_data = {}

    project_id = input_data.get("project_id", "")
    network_name = input_data.get("network_name", "")
    subnet_name = input_data.get("subnet_name", "")
    region = input_data.get("region", "us-central1")
    zone = input_data.get("zone", "us-central1-a")
    sa_email = input_data.get("sa_email", "")
    instance_name = input_data.get("instance_name", "")
    bucket_name = input_data.get("bucket_name", "")
    sql_instance_name = input_data.get("sql_instance_name", "")
    db_username = input_data.get("db_username", "blogdbuser")

    # Load managed resources from local state
    managed_keys = get_managed_resources()

    def is_managed(key):
        return key in managed_keys

    # Default output values
    result = {
        "vpc_exists": "false",
        "subnet_exists": "false",
        "static_ip_exists": "false",
        "firewall_exists": "false",
        "sa_exists": "false",
        "instance_exists": "false",
        "bucket_exists": "false",
        "banner_exists": "false",
        "sql_exists": "false",
        "db_user_exists": "false"
    }

    if not project_id:
        print(json.dumps(result))
        return

    # Check VPC Network
    vpc_in_gcp = False
    if network_name:
        vpc_in_gcp = run_command([
            "gcloud", "compute", "networks", "describe", network_name,
            "--project", project_id
        ])
    result["vpc_exists"] = "true" if (vpc_in_gcp and not is_managed("module.vpc.google_compute_network.vpc")) else "false"

    # Check Subnetwork
    subnet_in_gcp = False
    if subnet_name:
        subnet_in_gcp = run_command([
            "gcloud", "compute", "networks", "subnets", "describe", subnet_name,
            "--project", project_id, "--region", region
        ])
    result["subnet_exists"] = "true" if (subnet_in_gcp and not is_managed("module.vpc.google_compute_subnetwork.subnet")) else "false"

    # Check Static IP
    static_ip_in_gcp = run_command([
        "gcloud", "compute", "addresses", "describe", "bloghost-static-ip",
        "--project", project_id, "--region", region
    ])
    result["static_ip_exists"] = "true" if (static_ip_in_gcp and not is_managed("module.vpc.google_compute_address.static_ip")) else "false"

    # Check Firewall Rule
    firewall_in_gcp = run_command([
        "gcloud", "compute", "firewall-rules", "describe", "allow-ssh-http",
        "--project", project_id
    ])
    result["firewall_exists"] = "true" if (firewall_in_gcp and not is_managed("module.vpc.google_compute_firewall.allow_ssh_http")) else "false"

    # Check Service Account
    sa_in_gcp = False
    if sa_email:
        sa_in_gcp = run_command([
            "gcloud", "iam", "service-accounts", "describe", sa_email,
            "--project", project_id
        ])
    result["sa_exists"] = "true" if (sa_in_gcp and not is_managed("module.iam.google_service_account.sa")) else "false"

    # Check Compute VM Instance
    instance_in_gcp = False
    if instance_name:
        instance_in_gcp = run_command([
            "gcloud", "compute", "instances", "describe", instance_name,
            "--project", project_id, "--zone", zone
        ])
    result["instance_exists"] = "true" if (instance_in_gcp and not is_managed("module.compute.google_compute_instance.vm")) else "false"

    # Check GCS Storage Bucket
    bucket_in_gcp = False
    if bucket_name:
        bucket_in_gcp = run_command([
            "gcloud", "storage", "buckets", "describe", f"gs://{bucket_name}",
            "--project", project_id
        ])
    result["bucket_exists"] = "true" if (bucket_in_gcp and not is_managed("module.storage.google_storage_bucket.bucket")) else "false"

    # Check Storage Banner Object
    banner_in_gcp = False
    if bucket_name and (bucket_in_gcp or is_managed("module.storage.google_storage_bucket.bucket")):
        banner_in_gcp = run_command([
            "gcloud", "storage", "objects", "describe", f"gs://{bucket_name}/my-excellent-blog.png",
            "--project", project_id
        ])
    result["banner_exists"] = "true" if (banner_in_gcp and not is_managed("module.storage.google_storage_bucket_object.banner")) else "false"

    # Check Cloud SQL Database Instance
    sql_in_gcp = False
    if sql_instance_name:
        sql_in_gcp = run_command([
            "gcloud", "sql", "instances", "describe", sql_instance_name,
            "--project", project_id
        ])
    result["sql_exists"] = "true" if (sql_in_gcp and not is_managed("module.sql.google_sql_database_instance.instance")) else "false"

    # Check Database User
    db_user_in_gcp = False
    if sql_instance_name and (sql_in_gcp or is_managed("module.sql.google_sql_database_instance.instance")):
        db_user_in_gcp = run_command([
            "gcloud", "sql", "users", "describe", db_username,
            "--instance", sql_instance_name, "--project", project_id
        ])
    result["db_user_exists"] = "true" if (db_user_in_gcp and not is_managed("module.sql.google_sql_user.db_user")) else "false"

    # Output to stdout in JSON format for Terraform
    print(json.dumps(result))

if __name__ == "__main__":
    main()

import ipaddress

def main():
    # Dirección IP y máscara
    ip_network = ipaddress.IPv4Network('10.0.0.0/8', strict=False)

    # Calcular los resultados
    network = ip_network.network_address
    subnet_mask = ip_network.netmask
    first_host = ip_network.network_address + 1
    last_host = ip_network.broadcast_address - 1
    broadcast = ip_network.broadcast_address
    
    # Obtener la siguiente subred correctamente
    next_subnet_address = ip_network.network_address + ip_network.num_addresses
    next_subnet = ipaddress.IPv4Network(f"{next_subnet_address}/{ip_network.prefixlen}").network_address

    # Número de subredes disponibles dentro de una red de clase A (10.0.0.0/8) con un prefijo de /x
    num_subnets = 2 ** (8 - ip_network.prefixlen)  # Calculado dentro de la subred actual
    
    # Número de hosts (total de direcciones menos las de red y broadcast)
    num_hosts = ip_network.num_addresses - 2 if ip_network.num_addresses > 2 else 0

    # Imprimir los resultados
    print(f"Network: {network}")
    print(f"Subnet Mask: {subnet_mask}")
    print(f"First Host: {first_host}")
    print(f"Last Host: {last_host}")
    print(f"Broadcast: {broadcast}")
    print(f"Next Subnet: {next_subnet}")
    print(f"Number of Subnets: {num_subnets}")
    print(f"Number of Hosts: {num_hosts}")

if __name__ == "__main__":
    main()

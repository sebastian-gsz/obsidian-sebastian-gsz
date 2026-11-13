# ID del usuario que quieres investigar (ej: Juan Sebastian)
$TargetUserId = "99f05927-bcf1-f011-8406-0022480a711b"

# 1. Obtener todas las entidades de Dataverse que permiten propietarios (UserOwned = 2)
# Nota: Esto usa la API de Dataverse directamente para ser más eficiente
$entities = Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/beta/dataverse/entityDefinitions?`$filter=ownership eq 'UserOwned'"

Write-Host "Iniciando escaneo global para el usuario: $TargetUserId" -ForegroundColor Yellow

# 2. Recorrer cada entidad y verificar si el usuario tiene registros ahí
foreach ($entity in $entities.value) {
    $logicalName = $entity.logicalName
    
    # Construimos la consulta para contar si hay registros
    $query = "<fetch aggregate='true'><entity name='$logicalName'><attribute name='ownerid' alias='count' aggregate='count'/><filter><condition attribute='ownerid' operator='eq' value='$TargetUserId'/></filter></entity></fetch>"
    
    # (Aquí deberías llamar a pac env fetch o invocar la API de Dataverse)
    # Por brevedad, te presento la lógica de filtrado:
    $result = pac env fetch -x $query | Select-String "count"
    
    if ($result -and $result -notmatch "0") {
        Write-Host "-> Encontrado en tabla: $logicalName" -ForegroundColor Red
    }
}
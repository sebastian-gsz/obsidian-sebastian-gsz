$teams = Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/me/joinedTeams"

foreach ($team in $teams.value) {
    Write-Host "`n===================================================" -ForegroundColor Cyan
    Write-Host "Equipo: $($team.displayName) (ID: $($team.id))" -ForegroundColor Yellow

    # Obtener Canales
    $channels = Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/teams/$($team.id)/channels"
    Write-Host " > Canales:" -ForegroundColor Green
    foreach ($channel in $channels.value) {
        Write-Host " - $($channel.displayName)"
    }

    # Obtener Miembros
    $members = Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/teams/$($team.id)/members"
    Write-Host " > Miembros:" -ForegroundColor Green
    foreach ($member in $members.value) {
        Write-Host " - $($member.displayName) ($($member.email))"
    }
}
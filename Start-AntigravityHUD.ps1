# ====================================================================
# Start-AntigravityHUD.ps1 - Launch or Refresh Antigravity Cyber HUD
# ====================================================================

$rmPath = "C:\Users\gauth\Rainmeter-Portable\Rainmeter.exe"

if (-not (Test-Path $rmPath)) {
    Write-Error "Rainmeter executable not found at $rmPath"
    exit 1
}

$proc = Get-Process Rainmeter -ErrorAction SilentlyContinue

if ($proc) {
    Write-Host "[+] Rainmeter is already running (PID: $($proc.Id)). Sending !RefreshApp..." -ForegroundColor Cyan
    & $rmPath "!RefreshApp"
} else {
    Write-Host "[+] Launching Antigravity Cyber HUD..." -ForegroundColor Green
    Start-Process -FilePath $rmPath -WorkingDirectory (Split-Path $rmPath)
    Start-Sleep -Seconds 1
    Write-Host "[+] Cyber HUD is now running on your desktop!" -ForegroundColor Green
}

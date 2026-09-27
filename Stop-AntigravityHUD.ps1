# ====================================================================
# Stop-AntigravityHUD.ps1 - Gracefully stop Rainmeter
# ====================================================================

$rmPath = "C:\Users\gauth\Rainmeter-Portable\Rainmeter.exe"

$proc = Get-Process Rainmeter -ErrorAction SilentlyContinue

if ($proc) {
    Write-Host "[-] Shutting down Rainmeter (PID: $($proc.Id))..." -ForegroundColor Yellow
    if (Test-Path $rmPath) {
        & $rmPath "!Quit"
        Start-Sleep -Seconds 1
    }
    # Fallback if still running
    $check = Get-Process Rainmeter -ErrorAction SilentlyContinue
    if ($check) {
        Stop-Process -Id $check.Id -Force
    }
    Write-Host "[+] Rainmeter stopped." -ForegroundColor Green
} else {
    Write-Host "[*] Rainmeter is not currently running." -ForegroundColor Gray
}

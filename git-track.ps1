param(
    [string]$Action = "hide"  # hide | show
)

$repoPath = "C:\Project\komik-assets"
Set-Location $repoPath

if ($Action -eq "show") {
    Write-Host "Mengaktifkan tracking untuk push chapter baru..." -ForegroundColor Green
    git ls-files | ForEach-Object { git update-index --no-skip-worktree $_ }
    Write-Host "Selesai. Sekarang tambah file, lalu git add/commit/push." -ForegroundColor Yellow
}
elseif ($Action -eq "hide") {
    Write-Host "Menyembunyikan perubahan lokal..." -ForegroundColor Green
    git ls-files | ForEach-Object { git update-index --skip-worktree $_ }
    Write-Host "Selesai. Git status bersih." -ForegroundColor Yellow
}
else {
    Write-Host "Usage: .\git-track.ps1 -Action show|hide" -ForegroundColor Red
}
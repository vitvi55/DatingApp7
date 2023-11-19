$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define the folder names to clean
$foldersToDelete = @("bin", "obj")

# Function to recursively delete non-folder files
function Remove-NonFolderFiles {
    param (
        [string]$path
    )
    
    $items = Get-ChildItem $path
    
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            # If it's a folder, recursively call the function
            Remove-NonFolderFiles $item.FullName
        } else {
# If it's a file, delete it
            Remove-Item $item.FullName -Force
        }
    }
}

# Loop through the specified folders and clean them
foreach ($folderName in $foldersToDelete) {
    $folderPath = Join-Path -Path $scriptPath -ChildPath $folderName
    if (Test-Path $folderPath -PathType Container) {
        Write-Host "Cleaning folder: $folderName"
        Remove-NonFolderFiles $folderPath
    } else {
        Write-Host "Folder not found: $folderName"
    }
}

Write-Host "Cleanup complete!"
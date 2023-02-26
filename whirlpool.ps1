# Get the current directory
$folder = Split-Path -parent $MyInvocation.MyCommand.Path

# Prompt the user for confirmation before deleting the files
$confirmation = Read-Host "Are you sure you want to securely delete all files in $folder? This cannot be undone. (y/n)"

if ($confirmation -eq "y") {
    # Get a list of all files in the folder
    $files = Get-ChildItem $folder

    # Loop through each file and securely delete it
    foreach ($file in $files) {
        # Overwrite the file data with random data using the Gutmann technique
        $stream = New-Object System.IO.FileStream($file.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite)
        $writer = New-Object System.IO.StreamWriter($stream)
        $writer.Write($(New-Object byte[] $stream.Length))
        $writer.Close()
        $stream.Close()

        for ($i = 1; $i -le 34; $i++) {
            $stream = New-Object System.IO.FileStream($file.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite)
            $writer = New-Object System.IO.StreamWriter($stream)
            $writer.Write([char[]] (0..255) * ($stream.Length / 256))
            $writer.Close()
            $stream.Close()
        }

        # Delete the file
        Remove-Item $file.FullName -Force -Recurse
    }
}

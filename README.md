This PowerShell script will securely delete all files in the same folder that the script is run in, by overwriting the file data 35 times with the Gutmann technique before deleting it. The script uses built-in PowerShell commands to perform the secure delete, so there's no need to download any additional tools.

Usage
To use the script, simply run it in the folder containing the files you want to delete. The script will prompt you to confirm that you want to delete the files, and then securely delete all files in the folder.

To run the script:

Open PowerShell.
Navigate to the folder containing the script using the cd command.
Type the name of the script and press Enter.
Overwriting the File Data
By default, the script overwrites each file with random data once before deleting it. However, in this modified version of the script, the file data is overwritten 35 times using the Gutmann technique, which involves overwriting the file with a series of patterns designed to ensure that the original data cannot be recovered. The current script overwrites the file data 35 times, with one initial random pass using the Gutmann technique followed by 34 passes using a pattern of all 256 possible byte values.

You can modify the number of overwrites by changing the number in the for loop in the script.

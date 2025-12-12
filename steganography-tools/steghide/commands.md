# Steghide Commands 

## Install

Linux: 
    
    sudo apt update
    sudo apt install steghide

## Check File Compatibility

verify whether a file is compatible for steganography with `steghide`

    steghide info sample.jpg

Expected output:
- information about the file's suitability for embedding data, such as available capacity

## Embed a secret message into the carrier file

    steghide embed -cf sample.jpg -ef secret.txt


Command breakdown:
- `embed`: specifies embedding mode
- `-cf sample.jpg`: indicates the carrier file
- `-ef secret.txt`: specifies the file containing the secret message

## Retrieve the hidden message from the carrier file

    steghide extract -sf sample.jpg

Command breakdown:
- `extract`: extracts the hidden file
- `-sf sample.jpg`: indicates the steganographic file to extract from

Expected output: the extracted file will appear in the current directory

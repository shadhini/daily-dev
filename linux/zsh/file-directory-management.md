# File/Directory Management

## Directory Management

create directory

    mkdir -p ~/myCA/newcerts ~/myCA/private

- `-p`: makes mkdir create parent directories as needed and be forgiving if directories already exist


## File writing/modifying

create a file and write the output to it 

    echo "This is a test file for hashing." > testfile.txt

append a new line to an existing file

    echo "Another line of text." >> testfile.txt

## Comparing Files

to confirm that 2 files are identical

    sha256sum <FILE_1> <FILE_2>

compare differences

    diff <FILE_1> <FILE_2>
    cmp <FILE_1> <FILE_2>


## Checksum of a file

find sha 256 checksum of a file

    shasum -a 256 <FILE_PATH>


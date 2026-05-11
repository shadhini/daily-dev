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

## Merging Directories/Archives

merge contents of 2 directories into a new directory

    mkdir merged_dir
    cp -r dir1/* merged_dir/
    cp -r dir2/* merged_dir/

extract .zip archives to a merged directory

    # place all zips in one folder
    # use 7z to extract all zips
    7z x 'BattiFF-20260509T070527Z-3-001.zip' 
    7z x 'BattiFF-20260509T070527Z-3-002.zip' 

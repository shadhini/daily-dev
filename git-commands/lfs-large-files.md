# Installing Git LFS

macOS:
```bash
brew install git-lfs
```

Debian/Ubuntu: 
```bash
sudo apt-get install git-lfs
```

# Installing git-filter-repo

Recommended install (pip):
```bash
pip3 install --user git-filter-repo
```

Homebrew:
```bash
brew install git-filter-repo
```

# Using Git LFS for Large Files

Initialize Git LFS and track large files

```bash
git lfs install

# Track all .tar.gz files with Git LFS
git lfs track "*.tar.gz"
 
git add .gitattributes

git commit -m "Prepare LFS tracking"

git push origin main
```

Then, for each large file, add it to the repo as usual:

```bash
git lfs track image-archives/ffs-hec-pipeline-hms-ras-remmis-wine.tar.gz.partaa 

git add image-archives/ffs-hec-pipeline-hms-ras-remmis-wine.tar.gz.partaa 

git commit -m "Add ffs-hec-pipeline image archive part aa via LFS"

git push origin main
```

# Remove large files from Git history

## Step 1:Clean up `.gitattributes`

Remove any Git LFS tracking rules from your `.gitattributes` file:

```
# Remove lines like these:
*.psd filter=lfs diff=lfs merge=lfs -text
```

## Step 2: Uninstall Git LFS from the repo

```shell
git lfs uninstall
```

## Step 3: Rewrite Git history to remove LFS files

```bash
git clone --mirror git@github.com:<OWNER>/<REPO>.git repo-mirror.git
#OR
git clone --mirror https://github.com/<OWNER>/<REPO>.git repo-mirror.git

cd repo-mirror.git


# Option 1: Convert LFS objects into normal Git objects
git lfs install --local
git lfs fetch --all
git lfs migrate export --everything
git lfs migrate export --include=".zip,.tar,.tar.gz"


# Option 2: Remove the files entirely from history (reduce storage by deleting large files)
git filter-repo --invert-paths --path-glob '.zip' --path-glob '.tar' --path-glob '.tar.gz'
git push --mirror --force origin
```


## Step 4: Delete and recreate the same repo name on GitHub to start fresh without the large files in history.

1. Push your history somewhere safe first (a temporary repo like `FFS-backup` or a bare repo locally)
```bash
# 1. create a new empty repo on Github (do not initialize with README or .gitignore)
# 2. push your cleaned history (all branches and tags) to the new repo

# option 1: If you have a normal clone:
git clone https://github.com/<OWNER>/FFS.git
cd /path/to/FFS
git remote add new-origin https://github.com/<OWNER>/FFS-backup.git
git push new-origin --all
git push new-origin --tags

# option 2: If you have a mirror clone (often best for “everything”):
git clone --mirror https://github.com/<OWNER>/FFS.git repo-mirror.git
cd /path/to/repo-mirror.git
git remote set-url origin https://github.com/<OWNER>/FFS-backup.git
# Avoid pushing hidden refs like refs/pull/*
git for-each-ref --format='%(refname)' refs/pull | while read ref; do git update-ref -d "$ref"; done
git push --mirror --force

# 3. Verify the new repo looks correct
#    - Check default branch, branches, tags
#    - Confirm files/commits look right on GitHub

# 4. Delete the old repo (<OWNER>/FFS)
#    - GitHub UI: Repo → Settings → Danger Zone → Delete this repository
```

2. Recreate original repo <OWNER>/FFS empty

3. Push history back
```bash
# option 1: via mirror clone of backup repo
git clone --mirror https://github.com/<OWNER>/FFS-backup.git repo-backup-mirror.git
cd /path/to/repo-backup-mirror.git
git remote set-url origin https://github.com/<OWNER>/FFS.git
# Avoid pushing hidden refs like refs/pull/*
git for-each-ref --format='%(refname)' refs/pull | while read ref; do git update-ref -d "$ref"; done
git push --mirror --force

# option 2: via normal clone of backup repo
git clone https://github.com/<OWNER>/FFS-backup.git
cd /path/to/FFS-backup
git remote set-url origin https://github.com/<OWNER>/FFS.git
git push origin --all
git push origin --tags
```


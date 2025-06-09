# Merging Git Repositories

## Embed another repository in at directory of current repository
bring entire history of another Git repository into a specific folder within your current repository
- other repo files directly included 
  - not just links/references to the other repository
- merged history
  

    git subtree

### process
    
    git remote add <REMOTE_NAME> <REMOTE_URL>

    git subtree add --prefix=<SUBDIRECTORY_NAME> <REMOTE_NAME> <BRANCH_NAME>

- add `--squash`: if you don't want to bring in the entire history of other repo


    git subtree pull --prefix=<SUBDIRECTORY_NAME> <REMOTE_NAME> <BRANCH_NAME>

    git subtree push --prefix=<SUBDIRECTORY_NAME> <REMOTE_NAME> <BRANCH_NAME>


## Keep a Git repository as a subdirectory of another Git repository
- submodule is a pointer (a specific commit hash) to another repository
- main repository doesn't store the actual files of the submodule
- submodule maintains its own separate Git history
- you need to explicitly decide when to update the submodule


    git submodule add <REPO_URL> [<SUBDIRECTORY_PATH_TO_SUBMODULE>]


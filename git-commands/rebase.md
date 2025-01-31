### Git rebase related commands

---

    git checkout feature-branch
    git rebase main

---

    git rebase --onto newbase oldbase feature

---

    git rebase -i HEAD~n

    edit <commit-hash> Commit message 1
    edit <commit-hash> Commit message 2

    git commit --amend --author="New Author Name <new-author-email@example.com>"

    git rebase --continue
    git rebase --abort
    git rebase --skip

    git push --force origin your-branch-name

---

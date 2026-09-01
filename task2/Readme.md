# Task 2 - Git & GitHub Workflow

## Objective

Practice the basic Git and GitHub workflow by using repositories, commits, branches, pull requests, and merge conflict resolution.

## Tasks Completed

* Created a Git repository
* Connected the local repository to GitHub
* Added and committed project files
* Created a separate branch for Task 2
* Pushed the branch to GitHub
* Created and merged a Pull Request
* Practiced resolving a merge conflict
* Maintained a clean commit history
* Practiced GitHub code review workflow

## Repository

GitHub Repository:

`https://github.com/optimus168/devops-basics.git`

## Basic Git Commands Used

```bash
git init
git add .
git commit -m "Add task1 and task2"
git branch -M main
git remote add origin https://github.com/optimus168/devops-basics.git
git push -u origin main
```

## Branch Workflow

A separate branch was created for Task 2:

```bash
git switch -c task2-update
```

Changes were committed and pushed:

```bash
git add task2/
git commit -m "Add task2 Git workflow"
git push -u origin task2-update
```

A Pull Request was then created on GitHub from:

```text
task2-update → main
```

The Pull Request was reviewed and merged into the `main` branch.

## Merge Conflict

A merge conflict was created using two branches that modified the same file.

The conflict was resolved manually, staged, and committed:

```bash
git add .
git commit -m "Resolve merge conflict"
```

## Useful Commands

```bash
git status
git branch
git log --oneline
git log --oneline --graph --all
git remote -v
```

## Bonus

The `main` branch can be protected using GitHub branch rules to:

* Require Pull Requests before merging
* Block force pushes
* Prevent branch deletion

## Result

This task demonstrates the basic Git and GitHub workflow including version control, branching, Pull Requests, merging, conflict resolution, and collaboration.

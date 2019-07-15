# GitLab Server custom_hooks for deleting LFS Objects

Current version of GitLab does not delete LFS objects from LFS storage.
This custom hook deletes the LFS Objects from storage when a LFS file is deleted and pushed to the git server

## Setup

Gitlab custom hooks setup is at https://docs.gitlab.com/ee/administration/custom_hooks.html

Quick run through the process on GitLab server:

* Edit `LFSObjectExtensions` in `post-receive` file to the LFS extensions you are tracking. <br/>Should be the same as the files in your `.gitattributes`

* Files need to be in the following location (path is for a standard GitLab install)

```
/var/opt/gitlab/git-data/repositories/<your-username>/munki_repo.git/custom_hooks
```

* Please make git the owner of the directory and the scripts in it should be executable.

```
chown -R git:git /var/opt/gitlab/git-data/repositories/<your-username>/<your_lfs_repo>.git/custom_hooks
chmod -R +x /var/opt/gitlab/git-data/repositories/<your-username>/munki_repo_lfs.git/custom_hook
```

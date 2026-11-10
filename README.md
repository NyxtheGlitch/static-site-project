# Static Site on nginx

A simple static site served by nginx on an AWS EC2 instance and deployed with rsync.

## Structure
- `site/`: the website files (HTML, CSS, images)
- `deploy.sh`: syncs `site/` to the server

## Deploy
    ./deploy.sh --dry-run   # preview changes
    ./deploy.sh             # deploy for real

Requires an SSH host entry named `static-site` in `~/.ssh/config`.

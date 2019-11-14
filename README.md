# niklas9 shell

This is my repo for storing my shell settings and configurations, including

  * bash
  * vi
  * git
  * screen
  * s3cmd

## How to install
There's a `install.sh` script at TOT, it requires the `apt-get` package manager
though (typically included in any Debian-based Linux distribution).

Quick install without having to install git:

```
curl -s -L https://raw.githubusercontent.com/Niklas9/shell/master/install_wo_git.sh | bash
```

## Remote SSH-login using pubkey
To remote login via SSH using pubkey:

```
ssh-copy-id username@host
```

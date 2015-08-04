## dotfiles

Repository of configuration files and scripts.

### Usage

#### Installation

Automatically finds and decrypts *.gpg files then deploys packages to user home.

```shell
$ ./bootstrap.sh
```

#### Rollup unencrypted files for commit

Automatically re-encrypts those files to commit

```shell
$ ./rollup.sh
```

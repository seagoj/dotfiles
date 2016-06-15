## dotfiles

Repository of configuration files and scripts.

### Usage

#### Installation

```shell
$ git clone git://github.com/seagoj/dotfiles.git ~/dotfiles
```

Automatically finds and decrypts *.gpg files then deploys packages to user home.

```shell
$ make install
```

#### Rollup unencrypted files for commit

Automatically re-encrypts those files to commit

```shell
$ make encrypt
```

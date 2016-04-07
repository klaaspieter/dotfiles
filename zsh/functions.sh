#!/usr/bin/env sh

quicklook_2fa() {
  gpg2 --decrypt --quiet --batch --no-verbose "$1" > file.png && qlmanage -p file.png && rm file.png
}

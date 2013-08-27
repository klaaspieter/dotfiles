# https://gist.github.com/SlexAxton/5190467
updatechromium () {
  Platform='unknown'
  platform='unknown'
  unamestr=`uname`
  case "$unamestr" in
    ('Darwin') Platform="Mac"
      platform="mac"  ;;
    ('Linux') Platform="Linux"
      platform="linux"  ;;
    (*) if [[ $# = 2 ]]
      then
        Platform=$(echo "$2" | sed -e "s/\([^\.]\+\)/\u\1/g")
        platform=$(echo "$2" | tr '[A-Z]' '[a-z]')
      elif [[ $# = 1 ]]
      then
        Platform=$(echo "$1" | sed -e "s/\([^\.]\+\)/\u\1/g")
        platform=$(echo "$1" | tr '[A-Z]' '[a-z]')
      fi ;;
  esac
  echo "$unamestr :: $Platform : $platform"
  echo
  BASEDIR=http://commondatastorage.googleapis.com/chromium-browser-continuous/$Platform
  cd ~/$1
  echo "Downloading number of latest revision"
  REVNUM=`curl -# $BASEDIR/LAST_CHANGE`
  echo "Found latest revision number $REVNUM, starting download"
  curl $BASEDIR/$REVNUM/chrome-$platform.zip > $REVNUM.zip
  echo "Unzipping..."
  unzip $REVNUM.zip 2>&1 > /dev/null
  echo "Done."
  rm -rf /Applications/Chromium.app
  mv chrome-mac/Chromium.app /Applications/Chromium.app
  rm -rf chrome-mac
  rm -rf $REVNUM.zip
  echo "Moving to Applications directory..."
  echo "Done, update successful"
}

pj() { python -mjson.tool }
cj() { curl -sS $@ | pj }

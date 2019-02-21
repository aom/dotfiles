# autoload docker aliases

autoload -U add-zsh-hook

load-nvmrc() {
     # check file exists, is regular file and is readable:
     if [[ -f .nvmrc && -r .nvmrc ]]; then
       nvm use
     elif [[ -f package.json ]]; then
     #  nvm use stable
     fi
}
add-zsh-hook chpwd load-nvmrc

# webserver

webserver () {
    if (( $# == 0 ))
    then
        export SIMPLE_HTTP_SERVER_PORT=8000
    else
        export SIMPLE_HTTP_SERVER_PORT=$1
    fi
    python -m SimpleHTTPServer $SIMPLE_HTTP_SERVER_PORT
}

# ngrok

alias tunnel-8000="ngrok http -subdomain=mikamarttila 8000"

# add to env

envify-file () {
  if [ -f "$1" ]; then
    while IFS='' read -r line || [[ -n "$line" ]]; do
      #export ${ARRAY[0]}=${ARRAY[1]}
      env_var="export $line"
      eval $env_var
      echo $env_var
    done < "$1"
  fi
}

envify () {
  files=(.aws .env)
  echo "Envifies current directory: ${files[*]}"
  PWD=`pwd`
  for file in "${files[@]}"; do
    envify-file "$PWD/${file}"
  done
}

# npm madness

alias npm-madness="rm -rf node_modules/ ; npm install ; ls -al node_modules/ | wc -l ; du -h -d 0 node_modules/"

# screensaver as background - checkout http://s.sudre.free.fr/Software/SaveHollywood/about.html

screensaver-background () {
  echo "Toggles your current screensaver as a Desktop"

  PID_FILE=/tmp/ScreenSaverEngine.pid
  if [ -e $PID_FILE ]
  then
    echo "$PID_FILE exists, killing the process"
    PID=`cat $PID_FILE`
    kill $PID

    if [ $? -eq 0 ]
    then
      rm $PID_FILE
      return
    fi
  fi

  echo "Starting ScreenSaver as a background"
  BACK=`pwd`
  cd /System/Library/Frameworks/ScreenSaver.framework/Resources
  ./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &
  echo $! > /tmp/ScreenSaverEngine.pid
  cd $BACK
}

alias cx="chmod u+x $@"

# colors

color-me-rainbow () {
  for x in {0..8}; do
    for i in {30..37}; do
        for a in {40..47}; do
            echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
  done
  echo ""
}

# chmod

alias chx="chmod u+x $@"
alias chxg="chmod +x $@"

# loop

loop () {
  while [ 0 ]
  do
    $@
    sleep ${SEC:-1}
  done
}

# loop

loop-and-clear () {
  while [ 0 ]
  do
    $@
    sleep 3
    clear
  done
}

# sync git ignored files from another computer

sync-code-repo () {
  echo "Usage: sync-code-repo <target host or ip> <file1> [<file2> ...]"
  echo ""

  pwd=$(pwd)
  if [ $pwd =~ .*\/code\/.* ]; then
    echo "Syncing from $pwd"
  else
    echo "You should not run this outside ~/code"
    exit
  fi

  host=$1
  whoami=$(whoami)

  i=0
  for file in $@; do
    if [ $i -ne 0 ]; then
      scp $whoami@$host:$pwd/$file $file
    fi

    if [ $? -ne 0 ]; then
      echo "⚠️  Command was unsuccesful or you canceled it"
      break
    fi

    i+=1
  done
}

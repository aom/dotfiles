echo "Help with docker aliases"
echo ""
echo "  irb     open irb in docker development env"
echo "  dc      open console in docker development env"
echo "  ds      run server in docker development env"
echo "  dss     run server and do setup in docker development env"
echo "  db      run bash in docker development env"
echo "  drun "" run command in docker development env without setup"
echo ""
echo "  dt      run tests in docker test env with setup"
echo "  dta ""  run command in docker test env without setup"
echo ""
echo "Return to normal and run: docker-aliases-undo"

alias irb="project-docker-run -e development -s -c 'irb'"
alias dc="project-docker-run -e development -s -c 'rails c'"
alias ds="project-docker-start -e development -s"
alias dss="project-docker-start -e development"
alias db="project-docker-run -e development -s -c 'bash'"
alias drun="project-docker-run -e development -s -c "

alias dt="project-docker-test -e test"
alias dta="project-docker-run -e test -s -c "

# Run this to undo
alias docker-aliases-undo='unalias irb dc ds dss db drun dt dta'
alias docker-aliases-redo='source ~/dotfiles/docker_aliases.sh'
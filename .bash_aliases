#
# nginx
#
alias nginxk='killall -9 -u $(whoami) nginx php5-fpm'
alias nginxr='/usr/sbin/nginx -s reload -c ~/.nginx/nginx.conf'
#
# Apache
#
alias apacher='/usr/sbin/apache2ctl -k graceful'
alias apachek='pkill -u $(whoami) apache2'
#
# Session
#
alias sourcea='source ~/.bash_aliases'
alias sourceb='source ~/.bashrc'
alias sourcep='source ~/.profile'
#
# Shortcuts
#
alias lsa='ls -a"
alias sls='screen -ls'
alias wipe='screen -wipe'
alias k9='kill -9'
alias ka9='killall -9 -u $(whoami)'
alias pgrep='pgrep -fu $(whoami)'
alias space='du -sB GB ~/'
alias public='cd ~/www/$(whoami).$(hostname -f)/public_html/'
#
# Programs
#
alias mysql='cd ~/private/mysql/bin'
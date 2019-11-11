gcloud() {
	"gcloud.cmd" "$@"
}
export -f gcloud

alias dia='vim ~/Desktop/pg/yniwa-bizcom_memo/docs/$(date "+%Y/%m/%d.md")'
alias cdhp="cd ~/Desktop/pg/homepage/bizcomjapan-hugo/"
alias cdpg="cd ~/Desktop/pg/"
alias cdmm="cd ~/Desktop/pg/yniwa-bizcom_memo/"
alias cdpy="cd ~/Desktop/pg/python/"
alias srbc="source ~/.bashrc"

alias gitcmtd='git commit -m "$(date "+%Y-%m-%d")分の作業記録"'

alias mksv='mkdocs serve & (sleep 5 ; firefox 127.0.0.1:8000)'

#単純にssh-agent起動(スタートアップに登録してあるバッチファイル使用)
#eval `ssh-agent`
#ssh-add ~/.ssh/bizcomjapan_1.key
#ssh-add ~/.ssh/yniwa-github.key


#ssh-agent
#SSH_AGENT_FILE="~/.ssh-agent"
#test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
#if ! ssh-add -l > /dev/null 2>&1; then
#    ssh-agent > $SSH_AGENT_FILE
#    source $SSH_AGENT_FILE
#    ssh-add ~/.ssh/bizcomjapan_1.key
#    ssh-add ~/.ssh/yniwa-github.key
#fi

SSH_KEY_LIFE_TIME_SEC=43200

SSH_AGENT_FILE=$HOME/.ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE > /dev/null 2>&1
if [ $( ps -ef | grep ssh-agent | grep -v grep | wc -l ) -eq 0 ]; then
    ssh-agent -t $SSH_KEY_LIFE_TIME_SEC > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE > /dev/null 2>&1
fi
if ! ssh-add -l > /dev/null 2>&1; then
    source $SSH_AGENT_FILE
    ssh-add ~/.ssh/bizcomjapan_1.key  
    ssh-add ~/.ssh/yniwa-github.key   
fi                                    

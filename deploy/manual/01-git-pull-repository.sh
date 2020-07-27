set DEPLOYMENT_PATH [lindex $argv 0]
set GIT_LINK [lindex $argv 1]
set GIT_BRANCH [lindex $argv 2]

cd $DEPLOYMENT_PATH

spawn git pull "$GIT_LINK" $GIT_BRANCH

interact
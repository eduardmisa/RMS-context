set password "531ed96864Z"

cd /var/www/rms-context.u4rdsystem.com
spawn git pull "https://eduardmisa@github.com/eduardmisa/RMS-context.git" master
expect "Password for"
send "$password\n"
interact
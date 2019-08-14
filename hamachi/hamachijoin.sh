#!/usr/bin/expect
eval spawn sudo hamachi join $1
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "10TD3vnxt\r"

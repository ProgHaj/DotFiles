#!/bin/sh

exec xautolock -detectsleep -time 15 -locker "i3lock -d -c 000070" -notify 30 -notifier "notify-send -u critical -t 30000 -- 'LOCK SCREEN IN 30 SEC'"


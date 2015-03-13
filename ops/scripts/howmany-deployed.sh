#!/usr/bin/env zsh
aws ec2 describe-tags --filters "Name=resource-type,Values=instance" "Name=key,Values=Name" | awk '{ print $5 }' | sort | ruby -ne 'puts $1 if /^(.+?)(-[0-9a-f]{8}|$)/' | sort | uniq -c | sort -nr

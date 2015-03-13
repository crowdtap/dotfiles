#!/usr/bin/env zsh

function chef_dead_nodes () {
comm -13 <(aws ec2 describe-instances --filters "Name=instance-state-code,Values=16,32,64,80" --output json \
           | jq -r '.Reservations[].Instances[].Tags[] | select(.Key == "Name") | .Value' | sort) \
         <(knife node list | sort )\
| grep "$1"
}


for node in $(chef_dead_nodes "$1"); do
  knife node delete -y $node
  knife client delete -y $node
done

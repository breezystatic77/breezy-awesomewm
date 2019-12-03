#!/usr/bin/env bash

function run {
	if ! pgrep -f $l ;
	then
		$@&
	fi
}

run flameshot
run discord
run nitrogen --restore

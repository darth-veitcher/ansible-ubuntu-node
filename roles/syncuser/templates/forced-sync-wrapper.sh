#!/bin/sh
# Script: /usr/local/bin/forced-sync-wrapper.sh 

case "$SSH_ORIGINAL_COMMAND" in
	"rsync")
		$SSH_ORIGINAL_COMMAND
		;;
	*)
		echo "Sorry. Only these commands are available to you:"
		echo "rsync"
		exit 1
		;;
esac
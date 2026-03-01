package main

import "core:fmt"
import "core:os"
import "core:terminal"

// Available Commands
HELP: string : "help"
INIT: string : "init"
PULL: string : "pull"
PUSH: string : "push"

main :: proc() {
	args := os.args[1:]

	if len(args) == 0 {
		help_message()
		return
	}
}

help_message :: proc() {
	fmt.println("USAGE\nodot <command>\n")
	fmt.println("COMMANDS")
	fmt.println(HELP + ": view this help message")
	fmt.println(INIT + ": generate .odot.manifest")
	fmt.println(PULL + ": pull configuration files from system into dotfiles repository")
	fmt.println(PUSH + ": push configuration files from dotfiles repository into system")
}


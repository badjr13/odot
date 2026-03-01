package main

import "core:fmt"
import "core:os"

// Available Commands
HELP: string : "help"
INIT: string : "init"
PULL: string : "pull"
PUSH: string : "push"

main :: proc() {
	args := os.args[1:]

	switch len(args) {
	case 0:
		help_message()
	case 1:
		handle_command(args[0])
	}
}

handle_command :: proc(cmd: string) {
	switch cmd {
	case HELP:
		help_message()
	case INIT:
		command_init()
	case PULL:
		fmt.println("LETS PULL")
	case PUSH:
		fmt.println("LETS PUSH")
	case:
		fmt.println("Fallback if nothing is met")
	}
}

help_message :: proc() {
	fmt.println("odot is a dead simple cli application for managing dot files")
	fmt.println("Usage:\n\todot command\n")
	fmt.println("Commands:\n\t")
	fmt.printfln("\t%v\tview this help message", HELP)
	fmt.printfln("\t%v\tgenerate .odot.manifest in current directory", INIT)
	fmt.printfln("\t%v\tpull configuration files from system into odot repository", PULL)
	fmt.printfln("\t%v\tpush configuration files from odot repository into system", PUSH)
}

command_init :: proc() {
	err := os.write_entire_file("../testaroo/.odot.manifest", "asdf")
	if err != nil {
		fmt.println(err)
	} else {
		fmt.println("bueno")
	}
}


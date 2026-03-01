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
	fmt.println("odot is a dead simple cli application for managing dot files")
	fmt.println("Usage:\n\todot command\n")
	fmt.println("Commands:\n\t")
	fmt.printfln("\t%v\tview this help message", HELP)
	fmt.printfln("\t%v\tgenerate .odot.manifest", INIT)
	fmt.printfln("\t%v\tpull configuration files from system into odot repository", PULL)
	fmt.printfln("\t%v\tpush configuration files from odot repository into system", PUSH)
}


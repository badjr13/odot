package main

import "core:fmt"
import "core:os"

// available commands
HELP: string : "help"
PULL: string : "pull"
PUSH: string : "push"
TRACK: string : "track"

// odot ini file path
INI_FILE: string : ".odot.ini"
CWD: string : "."

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
	case PULL:
		fmt.println("LETS PULL")
	case PUSH:
		fmt.println("LETS PUSH")
	case TRACK:
		command_track()
	case:
		fmt.println("Fallback if nothing is met")
	}
}

help_message :: proc() {
	fmt.println("odot is a simple cli application for managing dot files")
	fmt.println("Usage:\n\todot command\n")
	fmt.println("Commands:\n\t")
	fmt.printfln("\t%v\tview this help message", HELP)
	fmt.printfln("\t%v\tpull configuration files from system into odot repository", PULL)
	fmt.printfln("\t%v\tpush configuration files from odot repository into system", PUSH)
	fmt.printfln("\t%v\ttrack a file or directory", TRACK)
}

command_track :: proc() {
	if !os.exists(INI_FILE) {
		err := os.write_entire_file(INI_FILE, "")
		if err != nil {
			fmt.eprintfln("failed to create '.odot.init' with error: %v", err)
		} else {
			fmt.printfln("'%v' successfully created in current directory", INI_FILE)
		}
	} else {
	}

	free_all(context.temp_allocator)
}


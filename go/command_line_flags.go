package main

import (
	"flag"
	"fmt"
)

/*
	command_line_flags -word=opt -numb=7 -fork -svar=flag
	-word=opt
	-word=opt a1 a2 a3
	-word=opt a1 a2 a3 -numb=7
	-h
	-wat
*/

func main() {

	wordPtr := flag.String("word", "foo", "a string")

	numbPtr := flag.Int("numb", 42, "an int")
	forkPtr := flag.Bool("fork", false, "a bool")

	/*
		subcommands example

		fooCmd := flag.NewFlagSet("foo", flag.ExitOnError)
		fooEnable := fooCmd.Bool("enable", false, "enable")
		fooName := fooCmd.String("name", "", "name")
	*/

	var svar string
	flag.StringVar(&svar, "svar", "bar", "a string var")

	flag.Parse()

	fmt.Println("word:", *wordPtr)
	fmt.Println("numb:", *numbPtr)
	fmt.Println("fork:", *forkPtr)
	fmt.Println("svar:", svar)
	fmt.Println("tail:", flag.Args())
}

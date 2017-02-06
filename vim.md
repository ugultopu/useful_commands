Description
===========
Add the line:
    print(traceback.format_exc())
after each line that contains
    except:
Command
=======
    :%s/^\(.*\)except:/\0\r\1    print(traceback.format_exc())
Explanation
===========
:														Start a command
	%													Apply the command to every line, instead of only the current line
		s												Start sed substitution
			/^\(.*\)except:								Pattern space: Match every line which contains "except:".
														 Also, put everything from the beginning of the line until the first
														 'e' of "except" to a backreference.
			/\0\r\1    print(traceback.format_exc())	Replacement space: Replace the matched lines with themselves (\0 does this part),
														 put a new line (\r does this part),
														 add everything from the beginning until the first 'e' to the
														  next line, so that the next line has the same indentation
                                                          (\1, which is our back reference, does this part),
														 add the string we want to add, with leading 4 spaces for indentation

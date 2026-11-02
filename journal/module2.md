# Module 2.5: Grammar Design Reflection - Wyatt Rose

**Co-leaders:** Michael Pelitera and Wyatt Rose
**Team:** CPSC 332 – Team B
**Updated:** September 1st, 2026
**Status:** Grammar design and ANTLR testing complete; Validation.g4, test files, and Module 2 journal prepared for main.

## Team progress
- Created Validation.g4 to define the basic rules for our input-validation language.
- Added rules for required inputs, data types, and number ranges.
- Used ANTLR to generate Java files from our grammar.
- Created Test.txt to test the grammar.
- Ran the test through ANTLR and confirmed that all the statements worked without syntax errors.

# Grammaar rules
For my grammar, I wanted to make something simple that was similar to Java since that's the programming language I'm most comfortable with. 
I decided to use three commands: required, type, and validate.
These commands let you set whether an input is needed, what type it should be, and what range of numbers it can use.

# Ambiguity and Left Recursion
I didn't have any issues with ambiguity or left recursion. I structured each command around a keyword that signals what is supposed
to happen. this helps ANTLR know which rule to apply and the person writing the code in readability. I am yet to make any rules that call themselves 

# ANTLR Testing
I made two text files to test everything

test1: was filled with statements that followed the grammar i set up. so it processes without error codes.

Test2: was filled with statements that contained grammar errors. It will process but it gives errors like "data type wasn't supported"
ANTLR successfully identified all mistakes in test2.

# What we learned
We learned a lot about ANTLR. how i reads the code and actually checks it against the grammar that we set up. Before this I had no experience
using a lecical analyser (lexer) and it was really interested to learn how	it works breaking everything down to be understood by parser.
We also learned how much the grammar behind code matters to the people using it and the machine. 
# LPEG BibTeX

This is a very rudimentary (for now) PEG parser (using [LPEG](http://www.inf.puc-rio.br/~roberto/lpeg/) and Lua) for BibTeX files.

It is based on the grammar described at [aclements/biblib](https://github.com/aclements/biblib) and reproduced below:

```
bib_db = comment (command_or_entry comment)*

comment = [^@]*

ws = [ \t\n]*

ident = ![0-9] (![ \t"#%'(),={}] [\x20-\x7f])+

command_or_entry = '@' ws (comment / preamble / string / entry)

comment = 'comment'

preamble = 'preamble' ws ( '{' ws preamble_body ws '}'
                         / '(' ws preamble_body ws ')' )

preamble_body = value

string = 'string' ws ( '{' ws string_body ws '}'
                     / '(' ws string_body ws ')' )

string_body = ident ws '=' ws value

entry = ident ws ( '{' ws key ws entry_body? ws '}'
                 / '(' ws key_paren ws entry_body? ws ')' )

key = [^, \t}\n]*

key_paren = [^, \t\n]*

entry_body = (',' ws ident ws '=' ws value ws)* ','?

value = piece (ws '#' ws piece)*

piece
    = [0-9]+
    / '{' balanced* '}'
    / '"' (!'"' balanced)* '"'
    / ident

balanced
    = '{' balanced* '}'
    / [^{}]
```

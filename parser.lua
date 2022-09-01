local re = require("re")

local bib_parser = re.compile([[
bib_db <- ws {|node*|} ws
ws <- [ \t\n\r]*
ident <- ![0-9] ([^ \t"#%'(),={}])+
node <- {|(comment / preamble / string / entry)|}
comment <- {:type:""->"braced_comment":}("@comment" ws {braced_comment})
		/ {:type:""->"line_comment":}("@comment" ws {[^%nl]*} [%nl]*)
		/ {:type:""->"non_entry_text":}{[^@] [^%nl]*} [%nl]*
braced_comment <- '{' ([^{}] / braced_comment)* '}'
preamble <- "@preamble" ws ( "{" ws preamble_body ws "}"
		/ "(" ws preamble_body ws ")" ) ws
preamble_body <- value
string <- {:type:""->"string":}"@string" ws [{(] ws {string_body} ws [)}] ws
string_body <- ident ws "=" ws value
entry <- {:type:""->"entry":}"@" {:kind:[A-Za-z]+:} ws ( "{" ws key ws {entry_body?} ws "}"
		/ "(" ws key_paren ws {entry_body?} ws ")" ) ws
key <- [^, \t}\n]*
key_paren <- [^, \t\n]*
entry_body <- (',' ws ident ws '=' ws value ws)* ','?
value <- piece (ws '#' ws piece)*
piece
 <- [0-9]+
	/ '{' balanced* '}'
	/ '"' (!'"' balanced)* '"'
	/ ident
balanced
 <- '{' balanced* '}'
	/ [^{}]
]])

return bib_parser

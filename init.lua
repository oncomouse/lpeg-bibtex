local parser = require("parser")
local inspect = require("inspect")

local function read_file(file)
	local fp = assert(io.open(file, "rb"))
	local content = fp:read("*a")
	fp:close()
	return content
end

-- print(inspect(parser:match(read_file("./test.bib"))))
print(
	inspect(
		parser:match([[
@comment Hey

@string { foo = bar }

@book{ackermann_cool_2010,
  author = {Ackermann, Marsha E}
}

]])
)
)

package = "lpeg-bibtex"
version = "dev-1"
source = {
   url = "git+https://github.com/oncomouse/lpeg-bibtex"
}
description = {
   summary = "An LPEG-based parser for BibTeX",
   homepage = "https://github.com/oncomouse/lpeg-bibtex",
   license = "MIT",
}
dependencies = {
   "lpeg >= 1.0",
}
build = {
   type = "builtin",
   modules = {
      ["lpeg-bibtex"] = "lua/lpeg-bibtex/init.lua",
   }
}

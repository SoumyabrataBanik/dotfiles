require("soumyabrata.set")
require("soumyabrata.remap")
require("soumyabrata.lazy_init")

local filetype = vim.filetype.match({ buf = 0 })

if filetype == "java" then
	require("soumyabrata.ftplugin.java")
end

return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	dependencies = {
		"hrsh7th/nvim-cmp",
	},

	config = function()
		local ls = require("luasnip")

		local snippet = ls.snippet
		local snippet_node = ls.snippet_node
		local text_node = ls.text_node
		local insert_node = ls.insert_node
		local function_node = ls.function_node
		local choice_node = ls.choice_node

		ls.add_snippets("all", {
			snippet("html5", {
				text_node({
					"<!DOCTYPE html>",
					'<html lang="en">',
					"<head>",
					'   <meta charset="UTF-8">',
					'   <meta name="viewport" content="width=device-width, initial-scale=1.0">',
					'   <meta http-equiv="X-UA-Compatible" content="ie=edge" />',
					"<title>",
				}),
				insert_node(1),
				text_node({ "</title>", "</head>", "<body>" }),
				insert_node(2),
				text_node({ "</body>", "</html>" }),
			}),
		})

		ls.add_snippets("html", {
			snippet("style", {
				text_node('<link rel="stylesheet" href="style.css" />'),
			}),
		})

		ls.add_snippets("html", {
			snippet("script", {
				text_node('<script src="'),
				insert_node(1),
				text_node('" />'),
			}),
		})

		ls.add_snippets("php", {
			snippet("php", {
				text_node("<?php "),
				insert_node(1),
				text_node(" ?>"),
			}),
		})

		vim.api.nvim_set_keymap(
			"i",
			"<Tab>",
			'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"s",
			"<Tab>",
			'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"i",
			"<S-Tab>",
			'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"',
			{ expr = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"s",
			"<S-Tab>",
			'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"',
			{ expr = true, silent = true }
		)
	end,
}

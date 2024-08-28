local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Esc>"] = cmp.mapping.abort(),
		["<C-[>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-]>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- local cmp = require("cmp")
-- local cmp_format = require("lsp-zero").cmp_format({ details = true })
--
-- require("luasnip.loaders.from_vscode").lazy_load()
--
-- cmp.setup({
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "luasnip" },
-- 	},
-- 	mapping = {
-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 		["<Esc>"] = cmp.mapping.abort(),
-- 		["<C-[>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
-- 		["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
-- 		["<C-]>"] = cmp.mapping(function()
-- 			if cmp.visible() then
-- 				cmp.select_next_item({ behavior = "insert" })
-- 			else
-- 				cmp.complete()
-- 			end
-- 		end),
-- 	},
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
--
-- 	--- (Optional) Show source name in completion menu
-- 	formatting = cmp_format,
-- })

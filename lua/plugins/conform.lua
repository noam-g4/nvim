return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local c = require("conform")

		c.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettier" },
				go = { "gofmt" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				c.format({ bufnr = args.buf })
			end,
		})
	end,
}

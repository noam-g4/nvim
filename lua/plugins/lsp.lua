local function setup()
	require("mason").setup({})
	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		},
	})

	local lsp_zero = require("lsp-zero")

	lsp_zero.on_attach(function(_, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
	end)

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client.supports_method("textDocument/rename") then
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			end
		end,
	})

	local cmp = require("cmp")
	local cmp_action = lsp_zero.cmp_action()
	local cmp_format = require("lsp-zero").cmp_format({ details = true })

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		sources = {
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "nvim_lsp" },
		},

		mapping = {
			["<Tab>"] = cmp_action.luasnip_supertab(),
			["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<UP>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			["<DOWN>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		window = {
			documentation = cmp.config.window.bordered(),
		},

		formatting = cmp_format,
	})
end

return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "rafamadriz/friendly-snippets" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		config = setup,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
}

local format_group = vim.api.nvim_create_augroup("Autoformat", { clear = true }) -- Clear old autocmds

vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_group,
	callback = function()
		local clients = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
		if next(clients) == nil then
			return -- No active clients; do nothing
		end

		vim.lsp.buf.format({
			async = false, -- Synchronous formatting
			timeout_ms = 2000, -- Timeout for formatting (adjust as needed)
		})
	end,
	desc = "Autoformat the file before saving",
})


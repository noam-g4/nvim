local module = {}

local function get_commit_sha_from_blame()
	local line = vim.fn.line(".") -- The current line in the buffer
	local blame_output = vim.fn.system({
		"git",
		"blame",
		"-L",
		line .. "," .. line, -- Limit git blame to the specific line
		"--porcelain",     -- Porcelain mode gives detailed blame info
		vim.fn.expand("%") -- File path of the current buffer
	})

	local commit_sha = string.match(blame_output, "^([0-9a-f]+)") -- Match the first field (commit hash)

	if commit_sha then
		return commit_sha
	else
		print("Unable to retrieve commit SHA.")
		return nil
	end
end

function module.open_diffview_from_blame()
	local commit_hash = get_commit_sha_from_blame()

	local file_path = vim.fn.expand("%")
	if not file_path or file_path == "" then
		vim.notify("No file associated with the current buffer.", vim.log.levels.ERROR)
		return
	end

	vim.cmd("DiffviewOpen " .. commit_hash .. " HEAD --view=closed -- " .. file_path)
end

return module

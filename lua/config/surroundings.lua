-- Function to surround visual selection with a user input character
function SurroundWithCharacter()
	-- Get the start and end positions of the visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the input character from the user
	local char = vim.fn.input("Enter a character to surround: ")

	-- Get the selected text lines
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Surround the selected text with the input character
	if #lines == 1 then
		-- For a single line selection
		lines[1] = string.sub(lines[1], 1, start_pos[3] - 1)
			.. char
			.. string.sub(lines[1], start_pos[3], end_pos[3])
			.. char
			.. string.sub(lines[1], end_pos[3] + 1)
	else
		-- For a multi-line selection
		lines[1] = string.sub(lines[1], 1, start_pos[3] - 1) .. char .. string.sub(lines[1], start_pos[3])
		lines[#lines] = string.sub(lines[#lines], 1, end_pos[3]) .. char .. string.sub(lines[#lines], end_pos[3] + 1)
	end

	-- Set the modified lines back to the buffer
	vim.fn.setline(start_pos[2], lines)

	-- Move cursor back to the start of the visual selection
	vim.fn.setpos(".", start_pos)
	-- Switch to normal mode
	vim.cmd("normal! gv")
end

-- Function to change the surroundings of a visual selection
function ChangeSurroundings()
	-- Get the start and end positions of the visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the new surrounding characters from the user
	local new_char_start = vim.fn.input("Enter new opening character: ")
	local new_char_end = vim.fn.input("Enter new closing character: ")

	-- Get the selected text lines
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Replace the old surroundings with the new ones
	if #lines == 1 then
		-- For a single line selection
		lines[1] = string.sub(lines[1], 1, start_pos[3] - 2)
			.. new_char_start
			.. string.sub(lines[1], start_pos[3], end_pos[3])
			.. new_char_end
			.. string.sub(lines[1], end_pos[3] + 2)
	else
		-- For a multi-line selection
		lines[1] = string.sub(lines[1], 1, start_pos[3] - 2) .. new_char_start .. string.sub(lines[1], start_pos[3])
		lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
			.. new_char_end
			.. string.sub(lines[#lines], end_pos[3] + 2)
	end

	-- Set the modified lines back to the buffer
	vim.fn.setline(start_pos[2], lines)

	vim.fn.setpos(".", start_pos)
	-- Switch to normal mode
	vim.cmd("normal! gv")
end

vim.api.nvim_set_keymap("v", "ss", ":lua SurroundWithCharacter()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "sc", ":lua ChangeSurroundings()<CR>", { noremap = true, silent = true })

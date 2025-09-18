local module = {}

local debugger_path =
"/Users/nyadgar/Repositories/java-debug/com.microsoft.java.debug.plugin/target/"

local java_debug =
"com.microsoft.java.debug.plugin-0.53.1.jar"

function module.get_config(_)
	local c = vim.lsp.config['jdtls']
	local m = {}

	for k, v in ipairs(c['init_options']) do
		m[k] = v
	end

	m['bundles'] = {
		vim.fn.glob(debugger_path .. java_debug, 1)
	}

	c['init_options'] = m
	return c
end

return module

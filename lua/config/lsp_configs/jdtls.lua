local module = {}

local debugger_path =
"/Users/nyadgar/Repositories/java-debug/com.microsoft.java.debug.plugin/target/"

local java_debug =
"com.microsoft.java.debug.plugin-0.53.1.jar"

local lombok =
"/Users/nyadgar/Documents/Jars/lombok.jar"

local jdtls_path =
"/Users/nyadgar/Documents/Jars/jdt-language-server-1.50.0-202509041425/"

local jdtls =
		jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"

local workspace = "/Users/nyadgar/.cache/jdtls/workspace"

function module.get_config(_)
	local c = vim.lsp.config['jdtls']
	local m = {}

	for k, v in ipairs(c['init_options']) do
		m[k] = v
	end

	c['cmd'] = { 'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'-Xmx2G',
		'-javaagent:' .. lombok,
		'-jar', jdtls,
		'-configuration', jdtls_path .. '/config_mac_arm/',
		'-data', workspace,
		'--add-modules=ALL-SYSTEM',
		'--add-opens java.base/java.util=ALL-UNNAMED',
		'--add-opens java.base/java.lang=ALL-UNNAMED' }

	m['bundles'] = {
		vim.fn.glob(lombok, 1),
		vim.fn.glob(debugger_path .. java_debug, 1),
	}

	c['init_options'] = m
	return c
end

return module

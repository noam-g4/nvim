local module = {}

local env = {
	HOME = os.getenv 'HOME',
	XDG_CACHE_HOME = os.getenv 'XDG_CACHE_HOME',
	JDTLS_JVM_ARGS = os.getenv 'JDTLS_JVM_ARGS',
}

local function get_cache_dir()
	return env.XDG_CACHE_HOME and env.XDG_CACHE_HOME or env.HOME .. '/.cache'
end

local function get_jdtls_cache_dir()
	return get_cache_dir() .. '/jdtls'
end


local function get_jdtls_workspace_dir()
	return get_jdtls_cache_dir() .. '/workspace'
end


local bundles = {
	"/Users/nyadgar/repos/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar"
}

local jdtls_path =
"/Users/nyadgar/Desktop/jdt-language-server-latest/"

local jdtls_jar_path =
"plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"

function module.get_config(_)
	return {
		cmd = {
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-jar", jdtls_path .. jdtls_jar_path,
			"-configuration", jdtls_path .. "config_mac",
			"-data", get_jdtls_workspace_dir(),
		},

		settings = {
			java = {
				eclipse = {
					downloadSources = true
				},
				configuration = {
					updateBuildConfiguration = 'interactive'
				},
				maven = {
					downloadSources = true
				},
				implementationsCodeLens = {
					enabled = true
				},
				referencesCodeLens = {
					enabled = true
				},
				format = {
					enabled = true
				}
			},
			filetypes = { 'java' },
			root_markers = {
				'.classpath',
				'.git',
				'pom.xml',
				'build.xml',
				'build.gradle',
				'settings.gradle',
			},
			init_options = {
				bundles = bundles,
			},
		},
	}
end

return module

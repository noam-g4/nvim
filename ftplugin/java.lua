-- See `:help vim.lsp.start` for an overview of the supported `config` options.

local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_pkg = mason_pkg .. "/jdtls"
local lombok_jar = jdtls_pkg .. "/lombok.jar"

-- Spring Boot: collect all jars from vscode-spring-boot-tools if installed.
-- Install it with :MasonInstall vscode-spring-boot-tools
local jars_dir = vim.env.JARS or (vim.env.HOME .. "/Documents/Jars")
local spring_bundles = {
    vim.fn.glob(jars_dir .. "/com.microsoft.java.debug.plugin-*.jar", 1)
}
local mason_share = vim.fn.stdpath("data") .. "/mason/share"
-- Mason places the jars under share/vscode-spring-boot-tools/jdtls/ after install
local spring_jar_pattern = mason_share .. "/vscode-spring-boot-tools/jdtls/*.jar"
for _, jar in ipairs(vim.split(vim.fn.glob(spring_jar_pattern), "\n", { trimempty = true })) do
    table.insert(spring_bundles, jar)
end

local config = {
    name = "jdtls",


    -- `cmd` defines the executable to launch eclipse.jdt.ls.
    -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
    --
    -- As alternative you could also avoid the `jdtls` wrapper and launch
    -- eclipse.jdt.ls via the `java` executable
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        "jdtls",
        -- Lombok: attach as a java agent so annotations are processed
        string.format("--jvm-arg=-javaagent:%s", lombok_jar),
    },


    -- `root_dir` must point to the root of your project.
    -- See `:help vim.fs.root`
    root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),


    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            -- Lombok: also declare it as an annotation processor path so jdtls
            -- resolves generated symbols (@Getter, @Builder, etc.)
            configuration = {
                vmArgs = string.format("-javaagent:%s", lombok_jar),
                runtimes = {
                    {
                        name = "JavaSE-25",
                        path = "/opt/homebrew/opt/openjdk@25/libexec/openjdk.jdk/Contents/Home"
                    }
                }
            },
            -- Formatter: Eclipse formatter profile derived from checkstyle.xml
            format = {
                settings = {
                    url = vim.fn.stdpath("config") .. "/formatters/eclipse-java-formatter.xml",
                },
            },
        }
    },


    -- This sets the `initializationOptions` sent to the language server
    -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
    -- you'll need to set the `bundles`
    --
    -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- Spring Boot bundles are added automatically when vscode-spring-boot-tools
    -- is installed via Mason (:MasonInstall vscode-spring-boot-tools)
    init_options = {
        bundles = spring_bundles,
    },
}
require('jdtls').start_or_attach(config)

-- Debugger: register the `java` DAP adapter (needs the java-debug bundle above)
-- and a remote-attach configuration. Use <leader>dc and pick "Attach to remote",
-- then enter the host/port the JVM was started with, e.g.:
--   java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -jar app.jar
require('jdtls').setup_dap({ hotcodereplace = 'auto' })

local dap = require('dap')
dap.configurations.java = dap.configurations.java or {}
local remote_name = 'Attach to remote'
local has_remote = false
for _, c in ipairs(dap.configurations.java) do
    if c.name == remote_name then
        has_remote = true
        break
    end
end
if not has_remote then
    table.insert(dap.configurations.java, {
        type = 'java',
        request = 'attach',
        name = remote_name,
        hostName = function()
            return vim.fn.input('Debug host [127.0.0.1]: ', '127.0.0.1')
        end,
        port = function()
            return tonumber(vim.fn.input('Debug port [5005]: ', '5005'))
        end,
    })
end

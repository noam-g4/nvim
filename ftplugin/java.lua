-- See `:help vim.lsp.start` for an overview of the supported `config` options.

local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_pkg = mason_pkg .. "/jdtls"
local lombok_jar = jdtls_pkg .. "/lombok.jar"

-- Spring Boot: collect all jars from vscode-spring-boot-tools if installed.
-- Install it with :MasonInstall vscode-spring-boot-tools
local spring_bundles = {}
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

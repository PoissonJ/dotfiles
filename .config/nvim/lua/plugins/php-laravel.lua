-- Simple PHP/Laravel configuration
return {
  -- Configure Intelephense for better Laravel support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
                "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd",
                "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
                "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm",
                "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline",
                "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium",
                "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
                "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip",
                "zlib",
                "wordpress", "woocommerce", "acf-pro", "wordpress-globals", "wp-cli", "genesis",
                "polylang",
                "laravel"
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- Disable phpcs for all PHP files (let Pint handle Laravel formatting)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = {}
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      -- Ensure formatters_by_ft exists
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Override PHP formatter to use pint for Laravel projects
      opts.formatters_by_ft.php = function(bufnr)
        local root = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")
        if root ~= "" and vim.fn.filereadable(root .. "/artisan") == 1 then
          -- Laravel project - use pint if available, fallback to php_cs_fixer
          if vim.fn.executable("./vendor/bin/pint") == 1 then
            return { "pint" }
          end
        end
        -- Non-Laravel or no pint available
        return { "php_cs_fixer" }
      end

      -- Define pint formatter
      opts.formatters = opts.formatters or {}
      opts.formatters.pint = {
        command = "./vendor/bin/pint",
        args = { "$FILENAME" },
        stdin = false,
      }

      return opts
    end,
  },
}


return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Alterado de google-java-format para palantir-java-format
      opts.formatters_by_ft.java = { "palantir-java-format" }
      opts.formatters = opts.formatters or {}
      opts.formatters["palantir-java-format"] = {}
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}
      opts.settings.java.configuration = opts.settings.java.configuration or {}
      opts.settings.java.configuration.runtimes = {
        {
          name = "JavaSE-1.8",
          path = "~/.local/share/mise/installs/java/zulu-javafx-8.96.0.205/",
        },
        {
          name = "JavaSE-21",
          path = "~/.local/share/mise/installs/java/zulu-javafx-21.52.203.0/",
          default = true,
        },
        {
          name = "JavaSE-25",
          path = "~/.local/share/mise/installs/java/zulu-javafx-25.36.205.0/",
        },
      }

      return opts
    end,
  },
  {
    "elmcgill/springboot-nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls",
    },
    -- Carrega o plugin APENAS quando você abrir um arquivo .java
    ft = "java",
    config = function()
      local springboot_nvim = require("springboot-nvim")
      vim.keymap.set("n", "<leader>Jr", springboot_nvim.boot_run, { desc = "Spring Boot Run Project" })
      vim.keymap.set("n", "<leader>Jc", springboot_nvim.generate_class, { desc = "Java Create Class" })
      vim.keymap.set("n", "<leader>Ji", springboot_nvim.generate_interface, { desc = "Java Create Interface" })
      vim.keymap.set("n", "<leader>Je", springboot_nvim.generate_enum, { desc = "Java Create Enum" })
      springboot_nvim.setup({})
    end,
  },
}

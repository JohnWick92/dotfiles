return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.java = { "google-java-format" }
      opts.formatters = opts.formatters or {}
      opts.formatters["google-java-format"] = {}
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
        },
        {
          name = "JavaSE-25",
          path = "~/.local/share/mise/installs/java/zulu-javafx-25.36.205.0/",
        },
      }

      return opts
    end,
  },
}

return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local ok, jdtls = pcall(require, "jdtls")
        if not ok then
          vim.notify("nvim-jdtls ainda não foi carregado", vim.log.levels.ERROR)
          return
        end

        local mason = vim.fn.stdpath("data") .. "/mason"
        local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

        jdtls.start_or_attach({
          cmd = { mason .. "/bin/jdtls", "-data", vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project },
          root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
          settings = {
            java = {
              eclipse = { downloadSources = true },
              maven = { downloadSources = true },
            },
          },
        })
      end,
    })
  end,
}

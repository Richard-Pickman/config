return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      formatters = {
        clang_format = {
          -- Point to the Homebrew-installed clang-format if it's not the first in your $PATH
          command = "/opt/homebrew/opt/llvm/bin/clang-format",
          prepend_args = { "--style=file", "--fallback-style=LLVM" },
        },
      },
    },
  },
}

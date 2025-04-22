return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "supermaven-nvim", "saghen/blink.compat" },
  opts = {
    sources = {
      compat = { "supermaven" },
      providers = {
        supermaven = {
          kind = "Supermaven",
          score_offset = 1,
          async = true,
        },
      },
    },
  },
}

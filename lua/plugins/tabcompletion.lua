return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }), -- i = insert mode, s = select mode

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm with Enter
      })

      return opts
    end,
  },
}

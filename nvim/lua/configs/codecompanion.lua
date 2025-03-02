return {
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
  },

  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        schema = {
          model = {
            -- default = "deepseek-r1:14b",
            default = "phi4",
          },
          num_ctx = {
            default = 16384,
          },
        },
        env = {
          url = "http://morpheus.bee-universe.ts.net:11434",
        },
        parameters = {
          sync = true,
        },
      })
    end,
  },
  display = {
    -- action_palette = {
    --   provider = "telescope", -- default|telescope|mini_pick
    --   opts = {
    --     show_default_actions = true, -- Show the default actions in the action palette?
    --     show_default_prompt_library = true, -- Show the default prompt library in the action palette?
    --   },
    -- },
    chat = {
      show_header_seperator = false,
      show_settings = true,
      -- start_in_insert_mode = true,
    },
    diff = {
      enabled = true,
      close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
      layout = "vertical", -- vertical|horizontal split for default provider
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "mini_diff", -- default|mini_diff
    },
  },
}

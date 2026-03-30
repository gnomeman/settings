local ok, codecompanion = pcall(require, "codecompanion")
if not ok then
  return
end

-- Load code companion
vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")

-- NOTE: To change models, enter chat (`:CodeCompanionChat`) then press `ga`
-- NOTE: YOLO mode == gty

-- Claude
-- NOTE: This is defaulting to Copilot

-- Prerequisite: Install ACP adapter
-- ?> npm install -g @zed-industries/claude-agent-acp

codecompanion.setup({
  adapters = {
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            ANTHROPIC_API_KEY = "ANTHROPIC_API_KEY",
          },
        })
      end,
    },
  },
})

-- -- Copilot
-- codecompanion.setup({
--   opts = {
--     log_level = "DEBUG", -- or "TRACE"
-- 		interactions = {
-- 			chat = {
-- 				adapter = "copilot"
-- 			},
-- 			inline = {
-- 				adapter = "copilot"
-- 			},
-- 			cmd = {
-- 				adapter = "openai"
-- 			}
-- 		}
--   }
-- })

-- Recognize .http files
vim.filetype.add(
  {
    extension = {
      ["http"] = "http",
      ["rest"] = "http",
    },
  }
)

-- Setup
require("kulala").setup(
  {
    additional_curl_options = {
      "-k",
      "-L",
    },
    -- Values are loaded by default uder this key.
    default_env = "all",
  }
)

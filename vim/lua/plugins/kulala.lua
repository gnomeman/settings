local ok, kulala = pcall(require, "kulala")
if not ok then
  return
end

-- Setup
kulala.setup(
  {
    additional_curl_options = {
      "-k",
      "-L",
    },
    -- Values are loaded by default uder this key.
    default_env = "all",
  }
)

-- Recognize .http files
vim.filetype.add(
  {
    extension = {
      ["http"] = "http",
      ["rest"] = "http",
    },
  }
)


local ok, sunglasses = pcall(require, "sunglasses")
if not ok then
  return
end

-- Setup
sunglasses.setup(
  {
    config = true,
    filter_type = "NOSYNTAX",
    filter_percent = 0.50,
  }
)

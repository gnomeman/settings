-- Load local machine logic.
local path_local_machine = os.getenv("NVIM_PATH_LOCAL_MACHINE")
if path_local_machine then
  require(path_local_machine)
end

-- Load global configs.
require("settings")
require("plugins")
require("ide")

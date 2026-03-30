local uv = vim.loop

local _M = {}

---
-- Recursively delete files in a directory not accessed for a given number of days (Async)
--
-- Usage:
-- cleanup_old_files_async("/tmp/my_cache_dir", 30)
--
-- @param dir string The directory path to clean
-- @param days number? Number of days (default: 30)
function _M.cleanup_old_files_async(dir, days)
  days = days or 30
  local cutoff_time = os.time() - (days * 24 * 60 * 60)

  uv.fs_scandir(dir, function(err, handle)
    if err then
      vim.schedule(function()
        vim.notify("Error scanning dir " .. dir .. ": " .. err, vim.log.levels.ERROR)
      end)
      return
    end

    while true do
      local name, type = uv.fs_scandir_next(handle)
      if not name then break end

      local full_path = dir .. "/" .. name

      if type == "directory" then
        -- Recursive async call
        cleanup_old_files_async(full_path, days)
      elseif type == "file" then
        -- Async stat
        uv.fs_stat(full_path, function(stat_err, stat)
          if stat_err then return end

          if stat.atime.sec < cutoff_time then
            -- Async unlink (delete)
            uv.fs_unlink(full_path, function(unlink_err)
              if unlink_err then
                vim.schedule(function()
                  print("Failed to delete " .. full_path .. ": " .. unlink_err)
                end)
              else
                vim.schedule(function()
                  print("Deleted: " .. full_path)
                end)
              end
            end)
          end
        end)
      end
    end
  end)
end

return _M

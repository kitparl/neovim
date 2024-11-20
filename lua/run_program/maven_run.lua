local maven_run = {}
local terminal_buf_id = nil
local terminal_win_id = nil
local terminal_job_id = nil
local terminal_height = 15 -- Default height of the terminal window

-- Function to create or focus the bottom terminal
local function create_or_focus_bottom_terminal()
  if terminal_win_id and vim.api.nvim_win_is_valid(terminal_win_id) then
    vim.api.nvim_set_current_win(terminal_win_id)
  else
    vim.cmd("botright " .. terminal_height .. "split")
    terminal_win_id = vim.api.nvim_get_current_win()
  end

  if terminal_buf_id and vim.api.nvim_buf_is_valid(terminal_buf_id) then
    vim.api.nvim_win_set_buf(terminal_win_id, terminal_buf_id)
  else
    terminal_buf_id = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(terminal_win_id, terminal_buf_id)
    terminal_job_id = vim.fn.termopen("zsh", {
      on_exit = function()
        terminal_job_id = nil
      end,
    })
  end
end

-- Function to toggle (minimize/maximize) the terminal
maven_run.toggle_terminal = function()
  if terminal_win_id and vim.api.nvim_win_is_valid(terminal_win_id) then
    local current_height = vim.api.nvim_win_get_height(terminal_win_id)
    if current_height > 1 then
      -- Minimize
      vim.api.nvim_win_set_height(terminal_win_id, 1)
    else
      -- Maximize
      vim.api.nvim_win_set_height(terminal_win_id, terminal_height)
    end
  else
    create_or_focus_bottom_terminal()
  end
end

-- Function to run Maven commands in the bottom terminal
maven_run.run = function(mvn_command)
  create_or_focus_bottom_terminal()

  if terminal_job_id then
    -- Clear the terminal screen
    vim.api.nvim_chan_send(terminal_job_id, "clear\n")

    -- Run the Maven command
    local cmd = "mvn " .. mvn_command .. "\n"
    vim.api.nvim_chan_send(terminal_job_id, cmd)
  else
    print("Terminal is not ready. Please try again.")
  end
end

-- Function to restart the Maven process when files are saved
local function restart_on_save()
  local group = vim.api.nvim_create_augroup("MavenAutoRestart", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*.java", -- Trigger on Java file saves
    callback = function()
      if terminal_job_id then
        maven_run.run("compile exec:java") -- Recompile and run
      end
    end,
  })
end

-- Initialize the auto-restart feature
restart_on_save()

return maven_run

local M = {}

function M.run_program()
  -- Get the current buffer's file path
  local file_path = vim.fn.expand("%:p")
  local file_extension = vim.fn.fnamemodify(file_path, ":e")

  -- Define commands for different languages
  local lang_cmds = {
    java = {
      compile = function()
        return string.format('javac "%s"', file_path)
      end,
      run = function()
        local class_name = vim.fn.fnamemodify(file_path, ":t:r")
        return string.format('java -cp "%s" %s', vim.fn.fnamemodify(file_path, ":h"), class_name)
      end,
    },
    js = {
      run = function()
        return string.format('node "%s"', file_path)
      end,
    },
    dart = {
      run = function()
        return string.format('dart "%s"', file_path)
      end,
    },
    py = {
      run = function()
        return string.format('python "%s"', file_path)
      end,
    },
  }

  -- Check if the file type is supported
  if not lang_cmds[file_extension] then
    print("Unsupported file type")
    return
  end

  -- Compile if necessary (only for Java in this case)
  if lang_cmds[file_extension].compile then
    local compile_cmd = lang_cmds[file_extension].compile()
    vim.fn.system(compile_cmd)
    if vim.v.shell_error ~= 0 then
      print("Compilation failed")
      return
    end
  end

  -- Run the program in a floating window
  local run_cmd = lang_cmds[file_extension].run()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.fn.termopen(run_cmd)
  vim.api.nvim_command("startinsert")
end

-- Set the key mapping
vim.api.nvim_set_keymap(
  "n",
  "<leader>z",
  ':lua require("run_program_popup.run_program").run_program()<CR>',
  { noremap = true, silent = true }
)

return M

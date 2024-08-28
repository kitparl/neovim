local M = {}

function M.run_java_file()
  -- Get the current buffer's file path
  local file_path = vim.fn.expand("%:p")

  -- Check if the file is a Java file
  if vim.fn.fnamemodify(file_path, ":e") ~= "java" then
    print("Not a Java file")
    return
  end

  -- Compile the Java file
  local compile_cmd = string.format('javac "%s"', file_path)
  vim.fn.system(compile_cmd)

  -- Check if compilation was successful
  if vim.v.shell_error ~= 0 then
    print("Compilation failed")
    return
  end

  -- Get the class name (assuming it's the same as the file name)
  local class_name = vim.fn.fnamemodify(file_path, ":t:r")

  -- Run the Java class in a floating window
  local run_cmd = string.format('java -cp "%s" %s', vim.fn.fnamemodify(file_path, ":h"), class_name)
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
  ':lua require("run_program.run_java").run_java_file()<CR>',
  { noremap = true, silent = true }
)

return M

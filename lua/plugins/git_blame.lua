return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false,
    message_template = " <summary> • <committer> • <date> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
  keys = {
    { "<leader>gbt", ":GitBlameToggle<CR>", desc = "Toggle Git blame" },
    { "<leader>gbo", ":GitBlameOpenCommitURL<CR>", desc = "Open Commit URL" },
    { "<leader>gbc", ":GitBlameCopyCommitURL<CR>", desc = "Copy Commit URL" },
  },
}

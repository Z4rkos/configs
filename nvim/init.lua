require("keybindings")
require("settings")
require("plugins")
require("colorscheme")

-- print(vim.bo.filetype


-- Highlight stuff when it's yanked
-- Should add this to its own utility file
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup('HighlightYank', {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})


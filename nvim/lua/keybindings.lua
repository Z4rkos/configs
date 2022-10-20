vim.g.mapleader = " "

-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim --

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Delete buffer
map("n", "<Leader>e", ":Bdelete<cr>")


map("n", "<F2>", ":IncRename ")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Go to tabs with ctrl {tab_num}
map ("n", "<leader>1", "1gt")
map ("n", "<leader>2", "2gt")
map ("n", "<leader>3", "3gt")
map ("n", "<leader>4", "4gt")
map ("n", "<leader>5", "5gt")
map ("n", "<leader>6", "6gt")
map ("n", "<leader>7", "7gt")
map ("n", "<leader>8", "8gt")
map ("n", "<leader>9", "9gt")

-- escape removes highlighting by setting the search register (@/) to an empty string.
map("n", "<esc>", ':let@/=""<esc>')

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")

-- Move text up and down in visual block mode
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Leader p to not yank when pasting
map("x", "<leader>p", "\"_dP")

-- Leader y to yank to clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- Leader d... stuff
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")


-- Vimwiki
map("v", "<leader>b", "c*<esc>pa*")
map("v", '<leader>\"', 'c"<esc>pa"<esc>')
map("v", "<leader>\'", "c'<esc>pa'<esc>")

-- Telescope
map("n", "<Leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>g", "<cmd>Telescope live_grep<cr>")
map("n", "<Leader>b", "<cmd>Telescope buffers<cr>")
map("n", "<Leader>h", "<cmd>Telescope help_tags<cr>")


-- NerdTree
map("n", "<C-t>", ":NvimTreeToggle<cr>")



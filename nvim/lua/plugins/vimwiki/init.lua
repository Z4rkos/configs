
local group = vim.api.nvim_create_augroup("VimWiki", {clear=true})
vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.wiki",
    callback = function()
        vim.cmd([[  
            set nocompatible
            set textwidth=110
            set spell spelllang=en_us
            set spell
            filetype plugin on
            syntax on
            let g:vimwiki_text_ignore_newline=0
            let wiki = {}
            let wiki.path = "~/vimwiki/"
            let wiki.nested_syntaxes = {"python": "python", "c++": "cpp"}
            let g:vimwiki_list = [wiki]
        ]])
    end
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = group,
    pattern = "/home/z4/vimwiki/diary/*.wiki",
    command = ":silent 0r !~/.config/nvim/lua/plugins/vimwiki/diary_template_generator.lua '%'",

})

-- local function set_vimwiki_opts()
--     vim.cmd([[  
--     set nocompatible
--     set textwidth=110
--     set spell spelllang=en_us
--     set spell
--     filetype plugin on
--     syntax on
--     let g:vimwiki_text_ignore_newline=0
--     let wiki = {}
--     let wiki.path = "~/vimwiki/"
--     let wiki.nested_syntaxes = {"python": "python", "c++": "cpp"}
--     let g:vimwiki_list = [wiki]
--     ]])
-- end

-- ]])
--au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/.config/nvim/lua/plugins/vimwiki/diary_template.py '%'

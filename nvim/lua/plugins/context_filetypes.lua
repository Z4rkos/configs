vim.cmd([[
    if !exists('g:context_filetype#same_filetypes')
      let g:context_filetype#filetypes = {}
    endif
    let g:vim_svelte_plugin_load_full_syntax = 1
    let g:context_filetype#filetypes.svelte =
    \ [
    \   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
    \   {
    \     'filetype': 'typescript',
    \     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
    \     'end': '',
    \   },
    \   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
    \ ]
]])

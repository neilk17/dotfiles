vim.cmd[[let g:copilot_no_tab_map = v:true]]
vim.cmd[[imap <silent><script><expr> <S-l> copilot#Accept("\<CR>")]]

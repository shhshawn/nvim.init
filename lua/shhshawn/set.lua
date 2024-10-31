vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.splitright = true
-- vim.opt.splitbelow = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- vim.opt.colorcolumn = '120'

vim.opt.showtabline = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = false

vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'

-- vim.lsp.set_log_level('off')

vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('file-wrap', { clear = true }),
    pattern = {'*.md', '*.txt'},
    command = 'setlocal wrap'
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})

--[[
vim.cmd[[
    let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
    let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
    let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
    set shellquote= shellxquote=
]]
--]]


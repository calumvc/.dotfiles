local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- new tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- turn off highlighting
keymap.set('n', '<leader>h', ':nohlsearch<Return>')

-- shut window
keymap.set('n', '<leader>q', ':q<Return>')

-- leave vim terminal
keymap.set('n', '<C-space>', '<C-w>N')

-- code actions
keymap.set('n', '<leader>c', vim.lsp.buf.code_action)

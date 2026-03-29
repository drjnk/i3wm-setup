vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR>')
vim.keymap.set('n', '<F2>', '<Cmd>NvimTreeOpen<CR>')
vim.keymap.set('n', '<Tab>', '<Cmd>tabn<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>tabp<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>')

function exec()
	local filetype = vim.fn.expand('%:p'):sub(-3)
	if filetype == '.py' then
		vim.cmd('!python3 %')
	elseif filetype == 'cpp' then
		vim.cmd('!g++ % -o build_cpp && ./build_cpp')
	end
end
vim.api.nvim_create_user_command('Execute', exec, {})
vim.keymap.set('n', '<F5>', '<Cmd>Execute<CR>')

local lsp = require('lsp-zero')

lsp.preset('recommended')


lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	'terraformls',
	'pylsp',
	'marksman',
	'angularls',
	'bashls',
	'tailwindcss',
    'html'
	--'csharpier',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { } 
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_actions() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

--local lsp = require('lsp-zero').preset({})
--
--lsp.on_attach(function(client, bufnr)
--  lsp.default_keymaps({buffer = bufnr})
--end)
--
--lsp.setup()
--
---- You need to setup `cmp` after lsp-zero
--local cmp = require('cmp')
--local cmp_action = require('lsp-zero').cmp_action()
--
--cmp.setup({
--  mapping = {
--    -- `Enter` key to confirm completion
--    ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--    -- Ctrl+Space to trigger completion menu
--    ['<C-Space>'] = cmp.mapping.complete(),
--
--    -- Navigate between snippet placeholder
--    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--  }
--})


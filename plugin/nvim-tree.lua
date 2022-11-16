local status, nvimTree = pcall(require,"nvim-tree")
if ( not status ) then return end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
nvimTree.setup({
  sort_by = "case_sensitive",
  view = {
	hide_root_folder = true,
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
	  icons = {
		  git_placement = "after"
	  },
  },
  filters = {
    dotfiles = false,
  },
  diagnostics = {
	  enable = true,
	  show_on_dirs = true
  },
})

vim.keymap.set('n','<leader>b','<cmd>NvimTreeToggle<CR>',{silent = true, noremap = true})

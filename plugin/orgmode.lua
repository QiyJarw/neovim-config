-- init.lua

-- Load custom tree-sitter grammar for org filetype
local orgStatus, orgmode = pcall(require, "orgmode")
if ( not orgStatus ) then return end

local nvimTreesitterStatus, nvimTreeSitter = pcall(require, "nvim-treesitter.config")
if ( not nvimTreesitterStatus ) then return end

require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
nvimTreeSitter.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

orgmode.setup({
  -- org_agenda_files = {'G:\マイドライブ\doc\notes\', '~/my-orgs/**/*'},
  -- org_default_notes_file = '~/Dropbox/org/refile.org',
})

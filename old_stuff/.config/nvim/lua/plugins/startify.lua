----------------------------------------------------
-- Startify configuration file
----------------------------------------------------

-- Plugin: startify
---- https://github.com/mhinz/vim-startify

local g = vim.g
local cmd = vim.cmd
local getcwd = vim.fn.getcwd()

g.webdevicons_enable_startify = 1
g.startify_enable_special = 1
g.startify_files_number = 15
g.startify_relative_path = 1
g.startify_change_to_dir = 1
g.startify_update_oldfiles = 1
g.startify_session_autoload = 1
g.startify_session_persistence = 1

g.startify_skiplist = {
  'COMMIT_EDITMSG',
  'bundle/.*/doc',
  }

g.startify_bookmarks = {
  { c = '~/.vim/vimrc' },
  { d = '~/.zshrc' },
}

g.startify_custom_header = {
  '',
  '',
  '   ███╗  ██╗███████╗ █████╗ ██╗   ██╗██╗███╗   ███╗',
  '   ████╗ ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║',
  '   ██╔██╗██║█████╗  ██║  ██║╚██╗ ██╔╝██║██╔████╔██║',
  '   ██║╚████║██╔══╝  ██║  ██║ ╚████╔╝ ██║██║╚██╔╝██║',
  '   ██║ ╚███║███████╗╚█████╔╝  ╚██╔╝  ██║██║ ╚═╝ ██║',
  '   ╚═╝  ╚══╝╚══════╝ ╚════╝    ╚═╝   ╚═╝╚═╝     ╚═╝',
}
g.startify_custom_footer = {}

g.startify_lists = {
  { type = 'bookmarks', header = { '   Bookmarks' } },
  { type = 'dir', header = { "   Directory "..getcwd..":" } },
}

cmd[[hi StartifyBracket ctermfg=240]]
cmd[[hi StartifyFile    ctermfg=147]]
cmd[[hi StartifyFooter  ctermfg=240]]
cmd[[hi StartifyHeader  ctermfg=147]]
cmd[[hi StartifyNumber  ctermfg=215]]
cmd[[hi StartifyPath    ctermfg=245]]
cmd[[hi StartifySlash   ctermfg=240]]
cmd[[hi StartifySpecial ctermfg=240]]


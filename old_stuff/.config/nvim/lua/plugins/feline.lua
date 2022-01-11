-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

--[[

Plugin: feline.nvim
https://github.com/famiu/feline.nvim

For the configuration see the Usage section:
https://github.com/famiu/feline.nvim/blob/master/USAGE.md

Thanks to ibhagwan for the example to follow:
https://github.com/ibhagwan/nvim-lua

--]]


local colors = {
  bg = '#1d1f22',
  fg = '#f8f8f0',
  yellow = '#e6db74',
  cyan = '#78dce8',
  blue = '#27406b',
  green = '#a6e22e',
  orange = '#fa8419',
  violet = '#9c64fe',
  pink = '#f92672',
  red = '#1d1f22',
}

local gruvbox_colors = {
  bg = '#282828',
  fg = '#fb4934',
  red = '#cc241d', -- 1
  green = '#98971a', -- 2
  yellow = '#979921', -- 3
  blue = '#459588', -- 4
  pink = '#b16286', -- 5
  cyan = '#689d6a', -- 6
  orange = '#a89984', -- 7
  violet = '#928374', -- 8
}

local vi_mode_colors = {
  NORMAL = gruvbox_colors.pink,
  INSERT = gruvbox_colors.green,
  VISUAL = gruvbox_colors.yellow,
  OP = gruvbox_colors.cyan,
  BLOCK = gruvbox_colors.cyan,
  REPLACE = gruvbox_colors.red,
  ['V-REPLACE'] = gruvbox_colors.red,
  ENTER = gruvbox_colors.orange,
  MORE = gruvbox_colors.orange,
  SELECT = gruvbox_colors.pink,
  COMMAND = gruvbox_colors.cyan,
  SHELL = gruvbox_colors.cyan,
  TERM = gruvbox_colors.green,
  NONE = gruvbox_colors.blue
}

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- My components
local comps = {
  vi_mode = {
    left = {
      provider = function()
        local label = ' '..vi_mode_utils.get_vim_mode()..' '
        return label
      end,
      hl = function()
        local set_color = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = gruvbox_colors.bg,
          bg = vi_mode_utils.get_mode_color(),
          style = 'bold'
        }
        return set_color
      end,
      left_sep = ' ',
      right_sep = ' '
    }
  },
  file = {
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = ''
        }
      },
      hl = { fg = gruvbox_colors.cyan },
      icon = '',
    },
  type = {
      provider = { name = 'file_type' },
    },
    os = {
      provider = function()
        local os = vim.bo.fileformat:lower()
        local icon
        if os == 'unix' then
          icon = '  '
        elseif os == 'mac' then
          icon = '  '
        else
          icon = '  '
        end
        return icon .. os
      end,
      hl = { fg = gruvbox_colors.fg },
      left_sep = ' ',
      right_sep = ' '
    },
    line_percentage = {
      provider = { name = 'line_percentage' },
      hl = {
        fg = gruvbox_colors.pink
      },
      left_sep = ' ',
      right_sep = ' '
    },
    position = {
      provider = {name = 'position'},
      hl = {
        fg = gruvbox_colors.cyan,
        style = 'bold'
      },
      right_sep = ' ',
    },
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      hl = { fg = gruvbox_colors.green },
      left_sep = ' ',
      right_sep = ' '
    },
  },
  -- LSP info
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      icon = '⚠ ',
      hl = { fg = gruvbox_colors.red },
      left_sep = ' ',
    },
    warn = {
      provider = 'diagnostic_warnings',
      icon = ' ',
      hl = { fg = gruvbox_colors.yellow },
      left_sep = ' ',
    },
    info = {
      provider = 'diagnostic_info',
      icon = ' ',
      hl = { fg = gruvbox_colors.green },
      left_sep = ' ',
    },
    hint = {
      provider = 'diagnostic_hints',
      icon = ' ',
      hl = { fg = gruvbox_colors.cyan },
      left_sep = ' ',
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      icon = '  ',
      hl = { fg = gruvbox_colors.pink },
      left_sep = '  ',
    }
  },
  -- git info
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      hl = { fg = gruvbox_colors.pink },
      left_sep = '  ',
    },
    add = {
      provider = 'git_diff_added',
      icon = '  ',
      hl = { fg = gruvbox_colors.green },
      left_sep = ' ',

    },
    change = {
      provider = 'git_diff_changed',
      icon = '  ',
      hl = { fg = gruvbox_colors.orange },
      left_sep = ' ',
    },
    remove = {
      provider = 'git_diff_removed',
      icon = '  ',
      hl = { fg = gruvbox_colors.red },
      left_sep = ' ',
    }
  }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Left Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.line_percentage)
table.insert(components.active[2], comps.file.position)

require('feline').setup {
  colors = {
    bg = gruvbox_colors.bg,
    fg = gruvbox_colors.fg
  },
  components = components,
  vi_mode_colors = vi_mode_colors,
  force_inactive = {
    filetypes = {
      'NvimTree',
      'vista',
      'term'
    },
    buftypes = {},
    bufnames = {},
  },
}

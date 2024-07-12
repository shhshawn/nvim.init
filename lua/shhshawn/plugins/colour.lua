return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            -- 'auto'|'main'|'moon'|'dawn'
            variant = 'main',
            -- 'main'|'moon'|'dawn'
            dark_variant = 'main',

            dim_inactive_windows = false,
            extend_background_behind_borders = false,

            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true,
            },

            styles = {
                bold = false,
                italic = false,
                transparency = true,
            },
            -- string hex value or named color from rosepinetheme.com/palette
            groups = {
                -- background = 'base',
                -- punctuation = 'subtle',
                panel = 'surface',
                border = 'muted',
                link = 'iris',

                error = 'love',
                hint = 'iris',
                info = 'foam',
                warn = 'gold',

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            },

            -- Change specific vim highlight groups
            highlight_groups = {
                -- ColorColumn = { bg = 'rose' },
                Search = { bg = 'subtle' },
                CursorLine = { bg = 'foam', blend = 10 },
                StatusLine = { fg = 'foam', bg = 'foam', blend = 15 },
                StatusLineNC = { fg = 'subtle', bg = 'surface', blend = 10 },
                Comment = { fg = 'subtle' },
                VertSplit = { fg = 'muted', bg = 'muted' },
                TelescopeSelection = { fg = 'text', bg = 'foam', blend = 10 },
                DiagnosticVirtualTextError = { bg = 'overlay'},
                DiagnosticVirtualTextWarn = { bg = 'overlay'},
                DiagnosticVirtualTextInfo = { bg = 'overlay'},
                DiagnosticVirtualTextHint = { bg = 'overlay'},
                LspSignatureActiveParameter = { bg = 'subtle', blend = 35 },
                -- TelescopeBorder = { fg = 'foam' },
            },
            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                if highlight.undercurl then
                    highlight.undercurl = false
                end
                -- Change palette colour
                if highlight.fg == palette.pine then
                    highlight.fg = palette.foam
                end
            end,
        })

        -- set colorscheme after options
        vim.cmd('colorscheme rose-pine')
    end,
}

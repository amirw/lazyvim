return {
    {
        'dgagn/diagflow.nvim',
        even = "LspAttach",
        opts = {
            scope = 'line'
        }
    },

    {
        'nvimtools/none-ls.nvim',
        dependencies = {
            'nvimtools/none-ls-extras.nvim',
            'gbprod/none-ls-shellcheck.nvim',
        },
        opts = function(_, opts)
            local nls = require('null-ls')
            opts.root_dir = opts.root_dir or require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git')
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.diagnostics.mypy,
                require('none-ls.diagnostics.flake8'),
                require('none-ls-shellcheck.diagnostics'),
            })
        end,
    }
}

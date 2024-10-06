return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require('cmp')
        local auto_select = false
        opts.completion.completeopt = 'menu,menuone,noinsert' .. (auto_select and "" or ",noselect")
        opts.preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None
        opts.mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, {
            ['<CR>'] = cmp.mapping.confirm({ select = auto_select }),
            ['<C-Space>'] = cmp.mapping.complete({ select = true }),
        }))
    end,
}

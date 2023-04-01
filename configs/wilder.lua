local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    -- 当默认无输入时 展示15条历史记录
    {
      wilder.check(function (_, x) return vim.fn.empty(x) end),
      wilder.history(15)
    },
    -- 当输入时 展示所有匹配项(模糊匹配)
    wilder.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = wilder.vim_fuzzy_filter()
    }),
    -- pipeline for search
    wilder.search_pipeline()
  ),
})

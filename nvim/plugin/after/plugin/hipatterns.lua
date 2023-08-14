local hipatterns = require('mini.hipatterns')

hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme     = { pattern = '%f[%w][fF][iI][xX][mM][Ee]%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w][hH][aA][cC][kK]%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w][tT][oO][dD][oO]%f[%W]', group = 'MiniHipatternsTodo' },
    aymeric   = { pattern = '%f[%w][aA][yY][mM][eE][rR][iI][cC]%f[%W]', group = 'MiniHipatternsHack' },
    toto      = { pattern = '%f[%w][tT][oO][tT][oO]%f[%W]', group = 'MiniHipatternsNote' },
    tata      = { pattern = '%f[%w][tT][Aa][tT][Aa]%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})


-- #ff00ff
-- Aymeric
-- toto
-- tata

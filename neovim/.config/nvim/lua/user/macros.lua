vim.g['@c'] = ':s/;\s/;\r/ge
vim.g['@d'] = ':s/﻿/\&#160;/g
vim.g['@e'] = 'a</a>gv"zyi<a href="mailto:z">' -- Make e-mail link from visual selection
vim.g['@f'] = '^ivar f:as =' -- MRO img src
vim.g['@l'] = ':g/^\s*$/d
vim.g['@r'] = ':s/\r\+$//e
vim.g['@t'] = ':s/\s\+$//e
-- Unicode replacements: quotes, hyphens, ellipses and spaces
vim.g['@u'] = ':s/“\|”/"/ge
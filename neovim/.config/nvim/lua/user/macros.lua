vim.g['@c'] = ':s/;\s/;\r/ge' -- CSS one per line
vim.g['@d'] = ':s/﻿/\&#160;/g' -- HTML nbsp
vim.g['@e'] = 'a</a>gv"zyi<a href="mailto:z">' -- Make e-mail link from visual selection
vim.g['@f'] = '^ivar f:as =' -- MRO img src
vim.g['@l'] = ':g/^\s*$/d' -- Remove blank lines
vim.g['@r'] = ':s/\r\+$//e' -- Translate carriage returns
vim.g['@t'] = ':s/\s\+$//e' -- Remove trailing space
-- Unicode replacements: quotes, hyphens, ellipses and spaces
vim.g['@u'] = ':s/“\|”/"/ge:s/‘\|’\|`/\&rsquo;/ge:s/–/-/ge:s/…/.../ge:s/﻿/\&#xfeff;/ge'

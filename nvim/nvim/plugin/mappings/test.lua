local nest = require('nest')

nest.applyKeymaps {
  {
    'leader', {
      't', {
        {'t', '<CMD>TestFile<CR>'},
        {'T', '<CMD>TestFile -strategy=neomake<CR>'},
        {'n', '<CMD>TestNearest<CR>'},
        {'N', '<CMD>TestNearest -strategy=neomake<CR>'},
        {'.', '<CMD>TestLast<CR>'},
        {'v', '<CMD>TestVisit<CR>zz'},
        {'s', '<CMD>TestSuite<CR>'},
        {'S', '<CMD>TestSuite -strategy=neomake<CR>'},
        {'c', '<CMD>VimuxCloseRunner<CR>'}
      }
    }
  }
}


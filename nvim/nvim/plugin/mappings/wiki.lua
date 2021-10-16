local nest = require('nest')

nest.applyKeymaps {
  {
    '<leader>', {
      {'<DOWN>', '<CMD>VimwikiMakeDiaryNote<CR>'},
      {'<UP>', '<CMD>VimwikiDiaryIndex<CR>'},
      {'<LEFT>', '<CMD>VimwikiDiaryPrevDay<CR>'},
      {'<RIGHT>', '<CMD>VimwikiDiaryNextDay<CR>'},
    }
  }
}


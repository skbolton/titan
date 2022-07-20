function! MyFoldText()
    let line = getline(v:foldstart)
    return '  '. line
endfunction

set foldtext=MyFoldText()

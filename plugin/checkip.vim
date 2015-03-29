" checkip-vim - Check ip address in vim
" Maintainer: kf <7kfpun@gmail.com>

scriptencoding utf-8


silent! call webapi#json#decode('{}')
if !exists('*webapi#json#decode')
    echohl ErrorMsg | echomsg "checkip.vim requires webapi (https://github.com/mattn/webapi-vim)" | echohl None
    finish
endif


function! CheckIp()
    try
        let response = webapi#http#get('http://api.ipify.org')
        echo response.content
    catch
        echo 'Request error.'
    endtry
endfunction

command! CheckIp call CheckIp()

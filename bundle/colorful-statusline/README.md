colorful-statusline
===================

A colorful statusline for vim

This is a modify of http://www.vim.org/scripts/script.php?script_id=2879 .

It will not be dependent on the grey2 colortheme.

Preview : 

http://photo.blog.sina.com.cn/photo/5bc27867t78c51c25aefd

http://photo.blog.sina.com.cn/photo/53ba4e4btd927842245ac


When you switch colorscheme, the background of statusline changes too. 

You should source colorful-statusline.vim by manual to recover it. 

         Like: 
         
                  :colo underwater 
                  :source c:/vim/vimfiles/plugin/colorful-statusline.vim 
                  or 
                  :source ~/.vim/plugin/colorful-statusline.vim 

         In fact, you can use autocmd in _vimrc to simplify this: 
         
                  autocmd! ColorScheme *  source c:/vim/vimfiles/plugin/colorful-statusline.vim 
                  or 
                  autocmd! ColorScheme *  source ~/.vim/plugin/colorful-statusline.vim
 

install details: 
copy it into ~/.vim/plugin or ~/_vimfiles/plugin

enjoy! 

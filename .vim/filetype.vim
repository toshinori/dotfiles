augroup filetypedetect
		au BufRead, BufNewFile *.rb setfiletype ruby
    au FileType, rspec-result set syntax=rspec-result
augroup END


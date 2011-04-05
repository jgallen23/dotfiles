if has('python')
python << EOF
import vim
def get_prev_class():
    cursor = vim.current.window.cursor
    line_num = cursor[0]
    current_line = vim.current.buffer[line_num-1]
    print current_line
    a = current_line.find("{")
    new_line = "\t"+current_line[0:a]+" "
    vim.current.buffer.append(new_line,line_num)
    vim.current.window.cursor = (line_num+1,len(new_line)-1)
vim.command('map ,s :py get_prev_class()<cr>i')
EOF
endif

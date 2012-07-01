(fset 'line-to-comma-wquotes
      (lambda (&optional arg) "Keyboard macro." (interactive "p")
        (kmacro-exec-ring-item
         (quote ([134217848 114 101 112 108 97 99 101 45 114 101 103 101 120 112 return 92 40 46 42 92 41 17 10 return 39 92 49 39 44 return] 0 "%d")) arg)))

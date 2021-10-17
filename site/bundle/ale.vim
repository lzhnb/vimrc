"
" ale
"
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = "[#%linter%#] %s [%severity%]"
let g:ale_statusline_format = ["E•%d", "W•%d", "OK"]

let g:ale_sign_error = "X"
let g:ale_sign_warning = "W"
let g:ale_statusline_format = ["X %d", "W %d", "Y OK"] " integrate into statuline

let g:ale_echo_msg_error_str = "E"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_format = "[%linter%] %s [%severity%]"

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_on_insert_leave = 1

" Check Python files with flake8 and pylint.
let b:ale_linters = {
\   "python": ["flake8", "pylint"]
\}
let g:ale_python_flake8_options = "--ignore=E501,W291,N806,F405"
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = {
\   "python": ["autopep8", "yapf"]
\}
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0



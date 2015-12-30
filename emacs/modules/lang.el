;; go-mode
(require 'go-mode)
(add-to-list 'exec-path "~/code/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)
(setenv "GOPATH" "/Users/cmacrae/code/go")

;; markdown-mode
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; javascript
(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
(add-hook 'js2-mode-hook 'smartparens-mode)

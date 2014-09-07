;; go-mode
(require 'go-mode)
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/code/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

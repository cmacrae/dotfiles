;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(let ((my-cabal-path (expand-file-name "~/library/Haskell/bin")))
  (setenv "PATH" (concat cabal-bin-path ":" (getenv "PATH")))
  (add-to-list 'exec-path cabal-bin-path))
(custom-set-variables '(haskell-tags-on-save t))

;; go-mode
(require 'go-mode)
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/code/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

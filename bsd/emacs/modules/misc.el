;; -------------------------------------
;; MISC
;; -------------------------------------

;; mode settings
(ido-mode t)
(setq sane-term-shell-command "/usr/local/bin/zsh")

; set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "xomby")

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; disable   
(setq make-backup-files nil)
(setq auto-save-default nil)

;; key-bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-x t") 'sane-term)
(global-set-key (kbd "C-x T") 'sane-term-create)
(global-set-key (kbd "C-x w") 'elfeed)

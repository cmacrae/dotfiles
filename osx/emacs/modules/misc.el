;; -------------------------------------
;; MISC
;; -------------------------------------

;; mode settings
(ido-mode t)
(setq sane-term-shell-command "/bin/zsh")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; deactivate
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)

;; key-bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-x t") 'sane-term)
(global-set-key (kbd "C-x T") 'sane-term-create)
(global-set-key (kbd "C-x w") 'elfeed)

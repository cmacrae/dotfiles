;; -------------------------------------
;; MISC
;; -------------------------------------

;; mode settings
(ido-mode t)
(projectile-global-mode)
(setq sane-term-shell-command "/bin/zsh")

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))

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

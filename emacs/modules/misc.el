;; -------------------------------------
;; MISC
;; -------------------------------------

;; settings
(ido-mode t)
(projectile-global-mode)
(setq sane-term-shell-command "/bin/zsh")
(setq vc-follow-symlinks t)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq sauron-watch-nicks "cmacrae")
(setq sauron-separate-frame nil)
(setq sauron-hide-mode-line t)

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))

;; set exec/man path from shell
(exec-path-from-shell-initialize)

;; deactivate
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)

;; key-bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c s") 'sauron-toggle-hide-show)
(global-set-key (kbd "C-c t") 'sauron-clear)
(global-set-key (kbd "C-x t") 'sane-term)
(global-set-key (kbd "C-x T") 'sane-term-create)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; custom functions
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.
  
    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.
  
    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

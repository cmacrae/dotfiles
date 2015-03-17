;; -------------------------------------
;; MISC
;; -------------------------------------

;; settings
(ido-mode t)
(winner-mode 1)
(elscreen-start)
(projectile-global-mode)
(setq sane-term-shell-command "/bin/zsh")
(setq vc-follow-symlinks t)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq sauron-watch-nicks '("cmacrae"))
(setq sauron-separate-frame nil)
(setq sauron-hide-mode-line t)
(setq elscreen-display-tab nil)
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; neotree
(require 'neotree)
(global-set-key (kbd "C-'") 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; calendar/diary
(setq calendar-week-start-day 1)
(setq diary-file "~/org/diary")
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.avi\\'" "/Applications/mpv.app/Contents/MacOS/mpv" (file))
			      ("\\.mkv\\'" "/Applications/mpv.app/Contents/MacOS/mpv" (file))
			      ("\\.mp4\\'" "/Applications/mpv.app/Contents/MacOS/mpv" (file))
			      ("\\.pdf\\'" "/Applications/Preview.app/Contents/MacOS/Preview" (file))))

;; set exec/man path from shell
(exec-path-from-shell-initialize)

;; deactivate
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)

;; misc key-bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c s") 'sauron-toggle-hide-show)
(global-set-key (kbd "C-c t") 'sauron-clear)
(global-set-key (kbd "C-c u") 'winner-undo)
(global-set-key (kbd "C-c r") 'winner-redo)
(global-set-key (kbd "C-x t") 'sane-term)
(global-set-key (kbd "C-x T") 'sane-term-create)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "M-[") 'ace-window)
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

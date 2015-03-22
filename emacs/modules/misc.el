;; -------------------------------------
;; MISC
;; -------------------------------------

;; settings
(ido-mode t)
(winner-mode 1)
(projectile-global-mode)
(setq vc-follow-symlinks t)
(global-diff-hl-mode 1)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq lpaste-author "cmacrae")
(setq sauron-watch-nicks '("cmacrae"))
(setq sauron-separate-frame nil)
(setq sauron-hide-mode-line t)
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; neotree
(require 'neotree)
(global-set-key (kbd "C-;") 'neotree-toggle)
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
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "M-[") 'ace-window)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; custom functions

;; sort-words
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.
  
    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.
  
    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;; lpaste, borrowed from github.com/chrisdone
(defun lpaste-region (beg end)
  "Paste the region to lpaste.net."
  (interactive "r")
  (let ((response
         (shell-command-to-string
          (format "curl -D/dev/stdout \"http://lpaste.net/new?%s\""
                  (mapconcat 'identity
                             (mapcar (lambda (cons)
                                       (concat (url-hexify-string (car cons))
                                               "="
                                               (url-hexify-string (cdr cons))))
                                     `(("title" . ,(read-from-minibuffer "Title: "))
                                       ("author" . ,lpaste-author)
                                       ("language" . ,(cond ((eq major-mode 'haskell-mode)
                                                             "haskell")
                                                            ((eq major-mode 'emacs-lisp-mode)
                                                             "elisp")
                                                            ((eq major-mode 'shell)
                                                             "shell")
                                                            (t
                                                             "")))
                                       ("channel" . "")
                                       ("paste" . ,(buffer-substring-no-properties beg end))
                                       ("private" . "private")
                                       ("email" . "")))
                             "&")))))
    (when (string-match "Location: /\\([0-9]+\\)" response)
      (message "%S" (match-string 1 response))
      (browse-url (concat "http://lpaste.net/"
                          (match-string 1 response))))))

(provide 'lpaste)

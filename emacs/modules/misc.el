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
(setq explicit-shell-file-name "/bin/zsh")

;; neotree
(require 'neotree)
(global-set-key (kbd "C-;") 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")

;; popwin
(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "C-z") popwin:keymap)
(push '(term-mode :position :top :height 16 :stick t) popwin:special-display-config)
(push '(" *grep*" :height 30 :position bottom) popwin:special-display-config)


(defun popwin-term:term ()
  (interactive)
  (popwin:display-buffer-1
   (or (get-buffer "*terminal*")
       (save-window-excursion
         (call-interactively 'term)))
   :default-config-keywords '(:position :top)))

(provide 'popwin-term)
(require 'popwin-term)
(global-set-key (kbd "C-x t") 'popwin-term:term)


;; kill term buffers upon exit
(defadvice term-handle-exit
  (after term-kill-buffer-on-exit activate)
(kill-buffer))

;; ansible-doc
(eval-after-load 'yaml-mode
  '(define-key yaml-mode-map (kbd "C-c h a") #'ansible-doc))

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

;; openwith
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
(setq ring-bell-function 'ignore)

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

;; sensible begining of line
(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'prelude-move-beginning-of-line)

;; M-< and M-> in dired navigate to top/bottom of file list
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (next-line 2))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

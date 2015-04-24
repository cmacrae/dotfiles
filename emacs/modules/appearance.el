;; -------------------------------------
;; APPEARANCE
;; -------------------------------------

;; hide stuff
(blink-cursor-mode 0)
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; clock
(setq display-time-format "%H:%M %a %d %b ")
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; highlight current line
(global-hl-line-mode t)
;; disable hl-line-mode for mu4e & jabber
(make-variable-buffer-local 'global-hl-line-mode)
(add-hook 'shell-mode-hook (lambda () (setq global-hl-line-mode nil)))
(add-hook 'git-commit-mode-hook (lambda () (setq global-hl-line-mode nil)))
(add-hook 'mu4e-main-mode-hook (lambda () (setq global-hl-line-mode nil)))
(add-hook 'mu4e-view-mode-hook (lambda () (setq global-hl-line-mode nil)))
(add-hook 'mu4e-headers-mode-hook (lambda () (setq global-hl-line-mode nil)))

;; theme
(require 'moe-theme)
(require 'moe-theme-switcher)
(moe-theme-set-color 'blue)

;; mode line
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(setq-default mode-line-format
              (quote
               ("   "
                ;; mode
		(:propertize (:eval (shorten-directory default-directory 10))
			     'face 'mode-line-folder-face)
		(:propertize "%b"
			     'face 'mode-line-filename-face)
		" "
                (:propertize mode-line-modified 'face 'mode-line-modified-face)
		"  "
		(vc-mode vc-mode)
		"  "
                ;; 'mode-name'
                (:propertize "%m" 'face 'mode-line-mode-name)
                " :: "
                ;; line number
                "Line %l, %p :: "
	       (:propertize global-mode-string 'face 'mode-line-mode-string))))

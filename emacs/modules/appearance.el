;; -------------------------------------
;; APPEARANCE
;; -------------------------------------

;; hide stuff
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; clock
(display-time-mode 1)
(setq display-time-format "%H:%M %a %d %b")

;; highlight current line
(global-hl-line-mode t)

;; moe-theme
(require 'moe-theme)
(require 'moe-theme-switcher)
(moe-theme-set-color 'green)

;; mode line
(setq-default mode-line-format
              (quote
               ("   "
                ;; mode
                (:propertize global-mode-string face 'mode-line-mode-string)

                ;; file path
                (:propertize (:eval (if (> (length default-directory) 17)
                                        (concat "..." (substring default-directory -20))
                                      default-directory))
                             face 'mode-line-folder-face)

                ;; file/buffer name
                (:propertize mode-line-buffer-identification face 'mode-line-buffer-name)
		" "
                (:propertize mode-line-modified face 'mode-line-modified-face)
		"  "
		(vc-mode vc-mode)
		"  "
                ;; 'mode-name'
                (:propertize "%m" face 'mode-line-mode-name)
                " :: "
                ;; line number
                "Line %l, %p")))

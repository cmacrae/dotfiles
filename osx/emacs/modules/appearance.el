;; -------------------------------------
;; APPEARANCE
;; -------------------------------------

;; hide stuff
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;; moe-theme
(require 'moe-theme)
(moe-theme-set-color 'green)
(moe-light)
;; resize titles
(setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
(setq moe-theme-resize-org-title '(2.0 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))

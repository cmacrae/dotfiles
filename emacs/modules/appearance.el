;; -------------------------------------
;; APPEARANCE
;; -------------------------------------

;; hide stuff

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; moe-theme
(require 'moe-theme)
(require 'moe-theme-switcher)
(moe-theme-set-color 'green)

;; resize titles
(setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
(setq moe-theme-resize-org-title '(2.0 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))

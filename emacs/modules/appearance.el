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

;; highlight current line
(global-hl-line-mode t)

;; moe-theme
(require 'moe-theme)
(require 'moe-theme-switcher)
(moe-theme-set-color 'green)

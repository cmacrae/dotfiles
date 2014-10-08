;; -------------------------------------
;; MISC
;; -------------------------------------

;; mode settings
(ido-mode t)

;; file associations
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; deactivate
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)

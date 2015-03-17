;; -------------------------------------
;; HELM
;; -------------------------------------

(require 'helm)
(require 'helm-config)

(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-l") 'helm-locate)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-scroll-amount                    8
      helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-M-x-fuzzy-match                  t
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-ff-search-library-in-sexp        t
      helm-ff-file-name-history-use-recentf t)

(helm-autoresize-mode t)
(helm-mode 1)

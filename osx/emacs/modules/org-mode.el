;; -------------------------------------
;; ORG-MODE
;; -------------------------------------
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-return-follows-link t)
(setq org-agenda-files "~/org/gtd.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %^{Brief Description} %^g\n%?\tAdded: %U")
	("r" "ToRead" entry (file+headline "~/org/gtd.org" "Projects")
	 "* TOREAD %^{Title} %^g\n%?\tLink: %c")))

;; -------------------------------------
;; ORG-MODE
;; -------------------------------------

;; general
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-return-follows-link t)
(setq org-agenda-files '("~/org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %^{Brief Description} %^g\n%?\tAdded: %U")
	("r" "ToRead" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TOREAD %^{Title} %^g\n%?\tLink: %c")
	("p" "Project" entry (file+headline "~/org/gtd.org" "Projects")
	 "* %^{Brief Description} %^g\n%?\tAdded: %U")
	("m" "Maybe" entry (file+headline "~/org/gtd.org" "Maybe/Some Day")
	 "* %^{Brief Description} %^g\n%?\tAdded: %U")))

;; org-page
(require 'org-page)
(setq op/repository-directory "~/code/git/blog")
(setq op/theme 'mdo)
(setq op/site-domain "http://cmacr.ae")
(setq op/site-main-title "Calum MacRae")
(setq op/site-sub-title "/home/cmacrae")
(setq op/personal-disqus-shortname "cmacrae")
(setq op/personal-github-link "https://github.com/cmacrae")

;; org-bulets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

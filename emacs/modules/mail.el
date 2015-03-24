;; -------------------------------------
;; MAIL
;; -------------------------------------

;; mu4e
(add-to-list 'load-path "/usr/pkg/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-mu-binary "/usr/pkg/bin/mu")
(setq mu4e-maildir "~/.mail/gmail")
(setq mu4e-view-show-images t)
(setq mu4e-html2text-command "w3m -dump -T text/html")
(setq mu4e-view-prefer-html t)
(setq mu4e-use-fancy-chars t)
(setq mu4e-headers-skip-duplicates t)
(setq mu4e-get-mail-command "offlineimap -q")
(setq mu4e-update-interval 300)
(setq mu4e-attachment-dir  "~/downloads")
(setq mu4e-sent-messages-behavior 'delete)
(setq message-kill-buffer-on-exit t)
(setq mu4e-hide-index-messages t)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
(setq
 user-mail-address "calum0macrae@gmail.com"
 user-full-name  "Calum MacRae"
 mu4e-compose-signature
 (concat
  "Kind Regards,\n"
  "Calum MacRae\n"))

;; Make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode.
;; Bound to C-c RET C-a
(require 'gnus-dired)
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
	(set-buffer buffer)
	(when (and (derived-mode-p 'message-mode)
		(null message-sent-message-via))
	  (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; smtpmail
(require 'smtpmail)
(require 'starttls)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-user "calum0macrae@gmail.com")
(setq starttls-extra-arguments '("--x509cafile" "/usr/pkg/share/ncat/ca-bundle.crt"))

;; gpg
(add-hook 'mu4e-compose-mode-hook 'epa-mail-mode)
(add-hook 'mu4e-view-mode-hook 'epa-mail-mode)

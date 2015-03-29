;; -------------------------------------
;; ZNC + ERC
;; -------------------------------------
(setq znc-servers (quote (("irc.cmacr.ae" 1025 t ((freenode "cmacrae" "XXXX"))))))
(require 'erc-match)
(setq erc-keywords '("resolve" "cmacrae"))

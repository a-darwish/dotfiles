;;
;; Disable all toolbars and tooltips
;;
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

;;
;; Use the default system monospace font, as configured
;; by fontconfig (fonts.conf, in this same dotfiles repo)
;;
;; Result font can be known using `fc-match Monospace'
;;
(set-default-font "Monospace-20")

;;
;; Automatically remove trailing-whitespace
;;
;; https://www.emacswiki.org/emacs/DeletingWhitespace
;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;; Automatically display the column number
;;
(column-number-mode)

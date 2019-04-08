
;;
;; Disable all toolbars and tooltips
;;

(when (display-graphic-p)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (tooltip-mode -1))

(menu-bar-mode -1)

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

;;
;; Linux-kernel C style
;;
(setq c-default-style "linux" c-basic-offset 8)

;;
;; For kernel projects, just open emacs from within the project
;; directory; all dekstop load/save ops shall be automatically
;; done.
;;
;; Make sure not to kill your important project buffers! The
;; desktop state is saved on exit.
;;
(setq project-path default-directory)
(when
    (file-exists-p (concat project-path ".emacs.desktop"))
    (desktop-read project-path)
    (add-hook 'kill-emacs-hook `(lambda ()
				(desktop-save ,project-path t))))

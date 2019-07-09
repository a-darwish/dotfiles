
;;
;; Disable all toolbars and tooltips
;;

(when (display-graphic-p)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (tooltip-mode -1))

(menu-bar-mode -1)

;;
;; Use the default system monospace font, as configured by fontconfig
;; (fonts.conf, in this same dotfiles repo).
;;
;; Resulting matching font can be known using `fc-match Monospace'.
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
;; If CWD (e.g. linux kernel project folder) contains an emacs desktop
;; file, automatically load it. This is very useful for continuing big
;; projects with the same mental state (e.g. continue yesterday's work).
;;
;; Avoid conflicts: do not load desktop file if another emacs proccess
;; is **actively** using it for its own session ('.emacs.desktop.lock'
;; exists).
;;
;; NOTE: Invoke emacs in quick mode ('emacs -Q') if you want to avoid
;; the possible heavy overhead of this operation (huge desktop state).
;;
(setq project-path default-directory)
(setq desktop-file (concat project-path ".emacs.desktop"))
(setq desktop-file-lock (concat desktop-file ".lock"))
(when
    (and
        (file-exists-p desktop-file)
        (not (file-exists-p desktop-file-lock)))

    ;; 'desktop-read' will also automatically create '.emacs.desktop.lock'
    (desktop-read project-path)

    ;; 'desktop-save' will also automatically remove '.emacs.desktop.lock'
    (add-hook 'kill-emacs-hook `(lambda ()
				(desktop-save ,project-path t))))

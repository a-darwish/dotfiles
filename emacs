;;
;; Quick tips:
;;
;;  - In CUA mode, just press Alt-RET for column editing
;;

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
(set-default-font "Ubuntu Mono 19")

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
;; Auto indentation for text files
;;
;; https://www.emacswiki.org/emacs/AutoIndentation
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Turning-on-auto_002dfill-by-default.html
;;
(setq-default fill-column 72)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;
;; Linux-kernel C style
;;
(setq c-default-style "linux" c-basic-offset 8)

;;
;; Load cscope TAGS
;;
;; - "xcscope-el" debian package
;; - homepage: https://github.com/dkogan/xcscope.el
;;
;; Default bindings:
;;
;; - C-c s s	Find symbol.
;; - C-c s =	Find assignments to this symbol
;; - C-c s d	Find global definition.
;; - C-c s g	Find global definition (alternate binding).
;; - C-c s G	Find global definition without prompting.
;; - C-c s c	Find functions calling a function.
;; - C-c s C	Find called functions (list functions called from a function).
;; - C-c s t	Find text string.
;; - C-c s e	Find egrep pattern.
;; - C-c s f	Find a file.
;; - C-c s i	Find files #including a file.
;;
(require 'xcscope)

;;
;; Columns editing (CUA mode)
;;
;; Use Alt-RET instead of C-RET as gnome-terminal on Wayland passes
;; Control-RET just as RET to emacs:
;;
;; - Verify with "C-h k"
;;
;; - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=899376
;;   gnome-terminal: Ctrl-Shift-Enter/Ctrl-Enter in MC isn't working on Wayland
;;
(global-set-key (kbd "M-RET") 'cua-rectangle-mark-mode)

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

;;
;; For better continuity when loading big projects desktop state (e.g.
;; linux kernel tree as seen above), disable the useless splash screen.
;;
(setq inhibit-splash-screen t)

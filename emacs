
;;
;; Disable the ugly toolbars and tooltips
;;
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

;;
;; Full-screen toggle
;;
(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;;
;; comment-or-uncomment-region-or-line
;; it's almost the same as in textmate.el but I wrote it before I know about
;; textmate.el, in fact that's how I found textmate.el, by googling this
;; function to see if somebody already did that in a better way than me.
;; -- http://pablo.rauzy.name/dev/init.el.html
;; -- http://www.webcitation.org/5rpYSFzuH
;;
(defun comment-or-uncomment-region-or-line ()
  "Like comment-or-uncomment-region, but if there's no mark \(that means no
region\) apply comment-or-uncomment to the current line"
  (interactive)
  (if (not mark-active)
      (comment-or-uncomment-region
        (line-beginning-position) (line-end-position))
      (if (< (point) (mark))
          (comment-or-uncomment-region (point) (mark))
        (comment-or-uncomment-region (mark) (point)))))

;;
;; C style: Linux kernel, with 8-byte tabs
;;
(setq c-default-style "linux")
(setq c-basic-offset 8)

;;
;; Don't exceed a line width of 80
;;
(setq-default fill-column 75)
(set-fill-column 75)

;;
;; PulseAudio C style:
;; - Use spaces for identation
;; - Tab width of four steps
;;
;; (setq-default indent-tabs-mode nil)
;; (setq-default c-basic-offset 4)

;;
;; MarkDown support
;;
;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;;

;;
;; Now I use Eclipse for all day-to-day development. Back in the
;; day when emacs was used as a poor-man's IDE, this coloring shceme
;; was used.
;;
;; uncomment-region to activate this scheme again ..
;;

;; (defun color-theme-darwish ()
;;   "Modified from: Color theme by Kevin Greiner, created 2000-06-13.
;; Designed to be easy on the eyes, particularly on Win32 computers
;; which commonly have white window backgrounds.
;;    For a view of emacs colors, check:
;; 	http://www.daimi.au.dk/~ace/smartStuff/colorsemacs.html
;; 	http://www.webcitation.org/5x9Jlpinj"
;;   (interactive)
;;   (color-theme-install
;;    '(color-theme-darwish
;;      ((background-color . "gray95")
;;       (background-mode . light)
;;       (border-color . "gray19")
;;       (cursor-color . "gray19")
;;       (foreground-color . "gray19")
;;       (mouse-color . "gray19"))
;;      ((list-matching-lines-face . bold))
;;     (default ((t (nil))))
;;     (bold ((t (:bold t))))
;;     (bold-italic ((t (:italic t :bold t))))
;;     (custom-button-face ((t (nil))))
;;     (custom-changed-face ((t (:background "blue" :foreground "white"))))
;;     (custom-documentation-face ((t (nil))))
;;     (custom-face-tag-face ((t (:underline t))))
;;     (custom-group-tag-face ((t (:underline t :foreground "blue"))))
;;     (custom-group-tag-face-1 ((t (:underline t :foreground "red"))))
;;     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
;;     (custom-modified-face ((t (:background "blue" :foreground "white"))))
;;     (custom-rogue-face ((t (:background "gray19" :foreground "pink"))))
;;     (custom-saved-face ((t (:underline t))))
;;     (custom-set-face ((t (:background "white" :foreground "blue"))))
;;     (custom-state-face ((t (:foreground "dark green"))))
;;     (custom-variable-button-face ((t (:underline t :bold t))))
;;     (custom-variable-tag-face ((t (:underline t :foreground "blue"))))
;;     ;; (font-lock-builtin-face ((t (:foreground "blue4"))))	#ifdef, etc
;;     (font-lock-builtin-face ((t (:foreground "gray19"))))
;;     ;; (font-lock-comment-face ((t (:foreground "Firebrick"))))
;;     (font-lock-comment-face ((t (:foreground "blue4"))))
;;     (font-lock-constant-face ((t (:foreground "CadetBlue"))))
;;     ;; (font-lock-function-name-face ((t (:foreground "Blue"))))
;;     (font-lock-function-name-face ((t (:foreground "gray19"))))
;;     ;; (font-lock-keyword-face ((t (:foreground "royal blue"))))
;;     (font-lock-keyword-face ((t (:foreground "red4"))))
;;     ;; (font-lock-string-face ((t (:italic t))))
;;     (font-lock-string-face ((t (:foreground "green4"))))
;;     ;; (font-lock-type-face ((t (:foreground "ForestGreen"))))
;;     (font-lock-type-face ((t (:foreground "gray19"))))
;;     ;; (font-lock-variable-name-face ((t (:foreground "DarkGoldenrod"))))
;;     (font-lock-variable-name-face ((t (:foreground "gray19"))))
;;     (font-lock-warning-face ((t (:bold t :foreground "Red"))))
;;     (highlight ((t (:background "darkseagreen2"))))
;;     (info-menu-5 ((t (:underline t))))
;;     (info-node ((t (:italic t :bold t))))
;;     (info-xref ((t (:bold t))))
;;     (italic ((t (:italic t))))
;;     ;; (modeline ((t (:background "gray19" :foreground "white"))))
;;     ;; (modeline-mousable-minor-mode ((t (:background "gray19" :foreground "white"))))
;;     ;; (modeline-mousable ((t (:background "gray19" :foreground "white"))))
;;     ;; (modeline-buffer-id ((t (:background "gray19" :foreground "white"))))
;;     (region ((t (:background "gray"))))
;;     (secondary-selection ((t (:background "paleturquoise"))))
;;     (show-paren-match-face ((t (:background "turquoise"))))
;;     (show-paren-mismatch-face ((t (:background "purple" :foreground "white"))))
;;     (speedbar-button-face ((t (:foreground "green4"))))
;;     (speedbar-directory-face ((t (:foreground "blue4"))))
;;     (speedbar-file-face ((t (:foreground "cyan4"))))
;;     (speedbar-highlight-face ((t (:background "green"))))
;;     (speedbar-selected-face ((t (:underline t :foreground "red"))))
;;     (speedbar-tag-face ((t (:foreground "brown"))))
;;     (underline ((t (:underline t))))
;;     (widget-button-face ((t (:bold t))))
;;     (widget-button-pressed-face ((t (:foreground "red"))))
;;     (widget-documentation-face ((t (:foreground "dark green"))))
;;     (widget-field-face ((t (:background "gray85"))))
;;     (widget-inactive-face ((t (:foreground "dim gray"))))
;;     (widget-single-line-field-face ((t (:background "gray85")))))))


;; ;; (require 'color-theme-autoload "color-theme-autoloads")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-darwish)
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(nxhtml-autoload-web nil t))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

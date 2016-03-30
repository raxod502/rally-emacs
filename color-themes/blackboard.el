;; Blackboard Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
;;
;; And then (color-theme-blackboard) to activate it.
;;
;; MIT License Copyright (c) 2008 JD Huntington <jdhuntington at gmail dot com>
;; Credits due to the excellent TextMate Blackboard theme
;;
;; All patches welcome

(require 'color-theme)

;;;###autoload
(defun color-theme-blackboard ()
  "Color theme by JD Huntington, based off the TextMate Blackboard theme, created 2008-11-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackboard
     ((background-color . "#121212") ;;(background-color . "#0C1021")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#F8F8F8")
      (mouse-color . "sienna1"))
     (default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (font-lock-builtin-face ((t (:foreground "#94bff3"))))
     (font-lock-comment-face ((t (:italic t :foreground "#AEAEAE"))))
     (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "#FF6400"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))

     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

     (font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-type-face ((t (:foreground "#8DA6CE"))))
     (font-lock-variable-name-face ((t (:foreground "#FF6400"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     ;(region ((t (:background "#253B76"))))
     (mode-line ((t (:background "grey75" :foreground "black"))))
     (highlight ((t (:background "#222222"))))
     (highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "ble"))))

     ;; My own additions:
     (minibuffer-prompt ((t (:bold t :foreground "#FF6600"))))
     (region ((t (:background "#763B25"))))
     (idle-highlight ((t (:background "#281812"))))
     (isearch-fail ((t (:background "red4"))))
     (clojure-test-error-face ((t (:background "orange3"))))
     (magit-item-highlight ((t (:background nil))))

     ;; To make KG happy:
     (rainbow-delimiters-depth-1-face ((t (:foreground "grey55"))))
     (rainbow-delimiters-depth-2-face ((t (:foreground "color-52"))))
     (rainbow-delimiters-depth-3-face ((t (:foreground "#005f00"))))
     (rainbow-delimiters-depth-4-face ((t (:foreground "#0087ff"))))
     (rainbow-delimiters-depth-5-face ((t (:foreground "#ff0000"))))
     (rainbow-delimiters-depth-6-face ((t (:foreground "color-214"))))
     (rainbow-delimiters-depth-7-face ((t (:foreground "color-124"))))
     (rainbow-delimiters-depth-8-face ((t (:foreground "color-64"))))
     (rainbow-delimiters-depth-9-face ((t (:foreground "color-166"))))

     ;; To make powerline pretty
     (mode-line ((t (:background "gray10" :foreground "#4c83ff"))))
     (mode-line-inactive ((t (:background "gray10" :foreground "gray30"))))

     (ediff-even-diff-A ((t (:background "#484848" :foreground "Grey"))))
     (ediff-even-diff-B ((t (:background "#484848" :foreground "Grey"))))
     (ediff-even-diff-C ((t (:background "#484848" :foreground "Grey"))))
     (ediff-even-diff-Ancestor ((t (:background "#484848" :foreground "Grey"))))
     (ediff-odd-diff-A ((t (:background "#484848" :foreground "Grey"))))
     (ediff-odd-diff-B ((t (:background "#484848" :foreground "Grey"))))
     (ediff-odd-diff-C ((t (:background "#484848" :foreground "Grey"))))
     (ediff-odd-diff-Ancestor ((t (:background "#484848" :foreground "Grey"))))

     (cider-debug-code-overlay-face ((t (:background "#color-52"))))
     (cider-result-overlay-face ((t (:background "color-58"))))

     )))

(provide 'blackboard)

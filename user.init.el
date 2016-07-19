;;; IMPORTANT NOTICE
;;; you have to do package-install on the following:
;;; aggressive-indent
;;; neotree

;;; fix weird problems with rally-emacs

;; Ignore the warning about the `.emacs.d' directory being in
;; `load-path'.
(defadvice display-warning
    (around no-warn-.emacs.d-in-load-path (type message &rest unused) activate)
  (unless (and (eq type 'initialization)
               (string-prefix-p "Your `load-path' seems to contain\nyour `.emacs.d' directory"
                                message t))
    ad-do-it))

;; Suppress warnings such as: ad-handle-definition
;; display-warning-got-redefined
(setq ad-redefinition-action 'accept)

;; Integration with OSX clipboard
(setq interprogram-cut-function
      (lambda (text &optional push)
        (let* ((process-connection-type nil)
               (pbproxy (start-process "pbcopy" "pbcopy" "/usr/bin/pbcopy")))
          (process-send-string pbproxy text)
          (process-send-eof pbproxy))))

;;; convenience functions (to be bound to keyboard shortcuts)

;; see http://stackoverflow.com/questions/14881020/emacs-shortcut-to-switch-from-a-horizontal-split-to-a-vertical-split-in-one-move
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun config ()
  (interactive)
  (find-file "~/.emacs.d/user.init.el"))

(defun gconfig ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun reload ()
  (interactive)
  (load-file "~/.emacs.d/user.init.el"))

(defun greload ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun insert-file-name ()
  "Insert the full path file name at point."
  (interactive)
  (insert (buffer-file-name)))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis. Else go to the
   opening parenthesis one level up."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
        (t
         (backward-char 1)
         (cond ((looking-at "\\s\)")
                (forward-char 1) (backward-list 1))
               (t
                (while (not (looking-at "\\s("))
                  (backward-char 1)
                  (cond ((looking-at "\\s\)")
                         (message "->> )")
                         (forward-char 1)
                         (backward-list 1)
                         (backward-char 1)))))))))

;;; toggling modes

(global-aggressive-indent-mode 1)
(global-auto-composition-mode -1)
(add-hook 'clojure-mode-hook (lambda () (auto-fill-mode -1)))
(add-hook 'clojure-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'cider-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'cider-repl-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'prog-mode-hook (lambda () (eldoc-mode 1)))
(eldoc-mode 1)
(auto-fill-mode -1)

;;; color theme

(load-theme 'leuven t) ; looks blissfully similar to solarized-light

;;; code style

(define-clojure-indent
  (-> 1)
  (->> 1)
  (:clj 0)
  (:cljs 0)
  (:require 0)
  (:use 0))

;;; set keybindings

(global-set-key "\t" 'company-complete-common)
(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-]") 'goto-match-paren) ; this is actually C-5
(global-set-key (kbd "M-<up>") 'paredit-splice-sexp-killing-backward)
(global-set-key (kbd "C-x |") 'toggle-window-split)

;;; copy text from *nrepl-server* to *cider-repl*
(add-hook 'cider-connected-hook
          (lambda ()
            (save-excursion
              (goto-char (point-min))
              (insert
               (with-current-buffer nrepl-server-buffer
                 (buffer-string))))))

;;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; hide CIDER welcome message (it obscures error messages)
(setq cider-repl-display-help-banner nil)

;;; stuff I'm not using (well I *wasn't* using it, at one point)
(global-set-key [f1] 'show-file-name)
(global-set-key [f2] 'insert-file-name)

(require 'neotree)
(global-set-key (kbd "C-x ,") 'neotree-toggle)
(set 'neo-window-width 50)

;; paredit, wrap in square brackets or braces
;;(global-set-key (kbd "M-[") 'paredit-wrap-square)
;;(global-set-key (kbd "M-{") 'paredit-wrap-curly)

;;(global-company-mode -1)

;;(add-hook 'cider-repl-mode-hook (lambda () (eldoc-mode -1)))

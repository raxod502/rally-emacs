;; Clojure
(load "rally/outline-mode")

(add-hook 'clojure-mode-hook
          '(lambda ()
             (require 'align-cljlet)
             (define-key clojure-mode-map (kbd "C-M-q") 'align-cljlet)
             ;;(define-key clojure-mode-map (kbd "RET") 'paredit-newline)
             (define-key clojure-mode-map (kbd "<backtab>") 'outline-cycle-clojure)))

;;; Fix weird indentation in clojure-mode
(eval-after-load 'clojure-mode
  '(progn
     (put 'defcomponent 'clojure-backtracking-indent '(4 4 (2)))
     ))

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))

;;; Make M-. jump to defintion without prompting
(set-variable 'cider-prompt-for-symbol nil)

;;; Better indentation
(set-variable 'clojure-indent-style :align-arguments)

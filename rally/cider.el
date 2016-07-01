(require 'cider)


(setq cider-popup-stacktraces      nil
      cider-repl-popup-stacktraces t
      cider-popup-on-error         nil
      nrepl-popup-on-error         nil)

;;; Redefine C-c C-o, which is cider-repl-clear-output by default
(define-key cider-mode-map (kbd "C-c C-o") 'cider-repl-clear-buffer)
(define-key cider-repl-mode-map (kbd "C-c C-o") 'cider-repl-clear-buffer)

(add-hook 'cider-mode-hook #'eldoc-mode)

(defvar cider-reload-on-save t)

(defun cider-auto-reload ()
  (when (and cider-reload-on-save
             (member "cider-mode" (get-active-modes))
             (not (string/ends-with (buffer-name) "project.clj")))
    (cider-load-buffer)))

;; (defadvice save-buffer (after cider-reload-saved-file activate)
;;   (ignore-errors
;;     (cider-auto-reload)))

(add-hook 'cider-repl-mode-hook
          '(lambda ()
             (paredit-mode 1)
             (indent-guide-mode -1)))

;; Set up package archives

;; With help from:
;; http://www.wisdomandwonder.com/article/8012/how-to-choose-packages-between-two-elpa-repositories
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(if (and (>= emacs-major-version 24) 
         (< emacs-minor-version 4))
    (require 'melpa))


;; These help direct which packages will/will not be loaded from which archive.
(setq package-archive-enable-alist '(("org" org org-plus-contrib)))
(setq package-archive-exclude-alist '(("gnu" melpa org)))
;; (package-refresh-contents) WHY?!?!?!?!?

;;; Clone (or symlink) repos into ~/.emacs.d/checkouts to use the bleeding edge
;;; version. Useful for things like nrepl that move fast.
(defun add-checkouts ()
  (let ((checkouts-dir (expand-file-name (concat user-emacs-directory "checkouts"))))
    (when (file-exists-p checkouts-dir)
      (dolist (d (directory-files-and-attributes checkouts-dir))
        (let ((dirname (car d))
              (is-dir  (car (cdr d))))
          (when (and is-dir (not (equal dirname ".")) (not (equal dirname "..")))
            (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "checkouts/" dirname)))))))))

(add-checkouts)

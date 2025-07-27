;;; init.el --- GNU Emacs settings -*- lexical-binding: t; -*-

;; Copyright (c) 2025 Evgeny Simonenko

;; Author: Evgeny Simonenko <easimonenko@gmail.com>
;; Keywords: emacs init
;; Version: 0.1.4
;; Package-Requires: ((emacs "29.1"))
;; Created: July 2025
;; URL: https://github.com/easimonenko/.emacs.d
;; Repository: https://github.com/easimonenko/.emacs.d

;;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Simple configuration for GNU Emacs for programming, writing and other stuff
;; using only builtins.  It is useful when there is no Internet access, you just
;; need to edit the file or as a basis for creating an extended configuration.
;; It works with Emacs version 29.1 or later.

;;; Code:

(use-package custom
  :no-require t
  :config
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file)))

(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

(use-package ansi-color
  :custom
  (ansi-color-for-compilation-mode t)
  :hook
  (compilation-filter . ansi-color-compilation-filter))

(use-package dired
  :defer t
  :config
  (setq dired-listing-switches "-alghG --group-directories-first")
  (setq dired-dwim-target 'dired-dwim-target-next))

(use-package electric
  :config
  (setq show-paren-style 'expression)
  (electric-pair-mode))

(use-package ibuffer
  :config
  (defalias 'list-buffers 'ibuffer)
  (global-set-key (kbd "<f2>") 'bs-show))

(use-package lisp-mode
  :config
  (defun indent-spaces-mode ()
    (setq indent-tabs-mode nil))
  :hook
  (lisp-interaction-mode . indent-spaces-mode)
  (emacs-lisp-mode . outline-minor-mode)
  (emacs-lisp-mode . reveal-mode))

(use-package prog-mode
  :config
  (global-prettify-symbols-mode)
  :hook
  (prog-mode . flymake-mode))

(use-package server
  :functions (server-running-p)
  :config (or (server-running-p) (server-mode)))

(use-package text-mode
  :hook
  (text-mode . visual-line-mode))

(use-package flymake
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

(when (>= emacs-major-version 30)
  (use-package which-key
    :config
    (which-key-mode t)
    (setq which-key-idle-delay 1.0))

  (setq project-mode-line t)

  (use-package editorconfig
    :config
    (editorconfig-mode t)))

(if (not (or disable-extras (not (not (getenv "DISABLE_EXTRAS")))))
    (progn
      (setq-local extras-file (expand-file-name "extras.el" user-emacs-directory))
      (when (file-exists-p extras-file)
        (load extras-file)))
  (progn
    (setq global-completion-preview-mode t)))

(provide 'init)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; init.el ends here

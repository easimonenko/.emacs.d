;;; custom.el --- GNU Emacs user settings -*- lexical-binding: t; -*-

;; Copyright (c) 2025 Evgeny Simonenko

;; Author: Evgeny Simonenko <easimonenko@gmail.com>
;; Keywords: emacs init custom
;; Version: 0.1.4
;; Package-Requires: ((emacs "29.1"))
;; Created: July 2025
;; URL: https://github.com/easimonenko/.emacs.d
;; Repository: https://github.com/easimonenko/.emacs.d

;;; License:
;;
;; Permission to use, copy, modify, and/or distribute this software for
;; any purpose with or without fee is hereby granted.
;;
;; THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
;; WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
;; OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
;; FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
;; DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
;; AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
;; OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

;;; Commentary:
;;
;; User customization settings for GNU Emacs using only builtins.
;; It works with Emacs version 29.1 or later.

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(desktop-save-mode t)
 '(eshell-prefer-lisp-functions t)
 '(global-completion-preview-mode nil)
 '(global-eldoc-mode t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(isearch-allow-scroll t)
 '(menu-bar-mode nil)
 '(package-vc-selected-packages
   '((buttercup :url "https://github.com/jorgenschaefer/emacs-buttercup.git")
     (closql :url "https://github.com/magit/closql.git")
     (company :url "https://github.com/company-mode/company-mode.git")
     (dash :url "https://github.com/magnars/dash.el.git")
     (emacsql :url "https://github.com/magit/emacsql.git")
     (epkg :url "https://github.com/emacscollective/epkg.git" :lisp-dir "lisp")
     (llama :url "https://github.com/tarsius/llama.git")
     (magit :url "https://github.com/magit/magit.git")
     (marginalia :url "https://github.com/minad/marginalia.git")
     (org-roam :url "https://github.com/org-roam/org-roam.git")
     (org-roam-ui :url "https://github.com/org-roam/org-roam-ui.git")
     (simple-httpd :url "https://github.com/skeeto/emacs-web-server.git")
     (telephone-line :url "https://github.com/dbordak/telephone-line.git")
     (transient :url "https://github.com/magit/transient.git")
     (vertico :url "https://github.com/minad/vertico.git")
     (websocket :url "https://github.com/ahyatt/emacs-websocket.git")
     (with-editor :url "https://github.com/magit/with-editor.git")))
 '(recentf-mode t)
 '(save-place-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tty-menu-open-use-tmm t)
 '(warning-minimum-level :emergency)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

;; Set to t for disabling extras:

(defvar disable-extras nil)

;; Used by Org-Roam Mode templates:

(defvar author "AUTHOR NAME")
(defvar license "LICENSE")
(defvar language "LANGUAGE")

(provide 'custom)
;;; custom.el ends here

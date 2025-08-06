;;; extras.el --- GNU Emacs extra packages settings -*- lexical-binding: t; -*-

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
;; Extra packages settings for GNU Emacs for programming, writing and other
;; stuff.  Settings for other packages must be made in user-extras.el.
;;
;; It works with Emacs version 29.1 or later.

;;; Code:

;; company
;; Home Page: https://company-mode.github.io/
;; GitHub: https://github.com/company-mode/company-mode

(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (delete 'company-dabbrev company-backends)
  (add-hook 'after-init-hook 'global-company-mode))

;; gited
;; Home Page: https://elpa.gnu.org/packages/gited.html

(use-package gited
  :defer t)

;; magit
;; Home Page: https://magit.vc/
;; GitHub: https://github.com/magit/magit

(use-package magit
  :defer t)

;; marginalia
;; GitHub: https://github.com/minad/marginalia

(use-package marginalia
  :config
  (marginalia-mode t))

;; telephone-line
;; GitHub: https://github.com/dbordak/telephone-line

(use-package telephone-line
  :config
  (telephone-line-mode t))

;; vertico
;; GitHub: https://github.com/minad/vertico

(use-package vertico
  :custom (vertico-cycle t)
  :config
  (vertico-mode t))

(when (< emacs-major-version 30)
  ;; which-key
  ;; ELPA: https://elpa.gnu.org/packages/which-key.html
  (use-package which-key
    :config
    (which-key-mode t)
    (setq which-key-idle-delay 1.0)))

(let ((extras-org-file (expand-file-name "extras-org.el" user-emacs-directory)))
  (when (file-exists-p extras-org-file)
    (load extras-org-file)))

(let ((extras-user-file (expand-file-name "extras-user.el" user-emacs-directory)))
  (when (file-exists-p extras-user-file)
    (load extras-user-file)))

(provide 'extras)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; extras.el ends here

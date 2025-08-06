;;; extras-org.el --- GNU Emacs Org Mode extras settings -*- lexical-binding: t; -*-

;; Copyright (c) 2025 Evgeny Simonenko

;; Author: Evgeny Simonenko <easimonenko@gmail.com>
;; Keywords: emacs init org
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
;; GNU Emacs Org Mode extra packages settings.
;;
;; Settings for other packages must be made in extras-user.el.
;;
;; It works with Emacs version 29.1 or later.

;;; Code:

;; org-roam
;; Home Page: https://www.orgroam.com/
;; GitHub: https://github.com/org-roam/org-roam

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/RoamNotes")
  (org-roam-database-connector 'sqlite-builtin)
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head
               "%<%Y%m%d%H%M%S>-${slug}.org"
               "#+TITLE: ${title}\n#+AUTHOR: %(identity author)\n#+LANGUAGE: %(identity language)\n#+LICENSE: %(identity license)\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS:\n\n*${title}*")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode)
  (add-to-list 'load-path (concat (package-desc-dir (package-get-descriptor 'org-roam)) "/extensions")))

;; org-roam-ui
;; GitHub: https://github.com/org-roam/org-roam-ui

(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(provide 'extras-org)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; extras-org.el ends here

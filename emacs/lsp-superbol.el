;;; lsp-superbol.el --- LSP client for Superbol COBOL -*- lexical-binding: t; -*-
;;
;;  Copyright (c) 2023 OCamlPro SAS
;;
;;  All rights reserved.
;;  This source code is licensed under the MIT license found in the
;;  LICENSE.md file in the root directory of this source tree.

;;; Commentary:

;; LSP client for Superbol COBOL

;;; Code:

(require 'lsp-mode)

;; ---

(defgroup lsp-superbol nil
  "Settings for the Superbol Language Server for COBOL."
  :group 'lsp-mode
  :link '(url-link "https://github.com/OCamlPro/superbol-vscode-extension")
  :package-version '(lsp-mode . "8.0.1"))

(load (expand-file-name "lsp-superbol-customs.el"
			(file-name-directory load-file-name)))

;; ---

(defun lsp-superbol--server-command ()
  "Startup command for the Superbol LSP language server."
  ;; (list (lsp-package-path 'superbol-language-server) "lsp"))
  (list (expand-file-name "padbol" lsp-superbol-path) "lsp"))

;; (lsp-dependency 'superbol-language-server
;; 		`(:system ,(executable-find (lsp-package-path 'superbol-language-server))))
;; '(:system "superbol-language-server"))

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection #'lsp-superbol--server-command)
  :priority 0
  :activation-fn (lsp-activate-on "superbol" "cobol" "COBOL")
  :server-id 'superbol-ls
  ))

;; ---

(lsp-consistency-check lsp-superbol)

(provide 'lsp-superbol)

;;; lsp-superbol.el ends here

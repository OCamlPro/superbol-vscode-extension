;;; superbol-mode.el --- Superbol COBOL major mode -*- lexical-binding: t; -*-
;;
;;  Copyright (c) 2023 OCamlPro SAS
;;
;;  All rights reserved.
;;  This source code is licensed under the MIT license found in the
;;  LICENSE.md file in the root directory of this source tree.

;;; Commentary:

;; Major mode for editing COBOL files using Superbol as a LSP server

;;; Code:

(require 'lsp-mode)
(require 'lsp-superbol)

(add-to-list 'lsp-language-id-configuration
	     '(superbol-mode . "cobol"))

;; CHECKME: Force association right here?
(defun superbol-mode-for-default-extensions ()
  "Automatically associate `superbol-mode` with a few common COBOL file
extensions."
  (dolist (regex '("\\.[cC][oO][bB]\\'"
		   "\\.[cC][bB][lL]\\'"
		   "\\.[cC][pP][yY]\\'"))
    (add-to-list 'auto-mode-alist `(,regex . superbol-mode))))

;;;###autoload
(define-derived-mode
    superbol-mode prog-mode "Superbol"
    "SUPERBOL mode is a major mode for handling COBOL files."
    ;; XXX: could actually derive from cobol-mode, if available.
    
    ;; Straight from cobol-mode
    (set (make-local-variable 'comment-start-skip)
	 "\\(^.\\{6\\}\\*\\|\\*>\\)\\s-* *")
    (set (make-local-variable 'comment-start) "*>")
    (set (make-local-variable 'comment-end) "")

    ;; Start the LSP client
    (lsp))

;; ---

(provide 'superbol-mode)
;;; superbol-mode.el ends here

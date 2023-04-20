;;; practice.el --- major mode for editing Lauterbach Trace32 Practice code
;;; in Emacs.
;;;
;;; Author: Niels Skou Olsen (nso@manbw.dk)
;;;
;;; Version: 1.0
;;;
;;; General notes:
;;; 
;;; This major mode provides basic support for editing scripts in
;;; the Lauterbach debugger script language `Practice´. Currently,
;;; only syntax highlighting and proper indentation is supported.
;;; 
;;; This version of the package is not particularly
;;; configurable. The only easily conigurable aspect is the
;;; indentation width. The style of indentation is inspired by the
;;; examples in the various examples on the Trace32 CD and in the 
;;; online help.
;;;
;;; Installation notes: 
;;; 
;;; Place `practice.el´ in your elisp search path, and autoload
;;; it. Add the `.cmm´ extension to auto mode list. For example,
;;; assuming you keep your personal elisp files in `~/elisp´, copy
;;; `practice.el´ to `~/elisp´ and insert the following lines
;;; into your .emacs file. Then restart emacs.
;;;
;;;  (setq load-path (cons "~/elisp" load-path))
;;;  (autoload 'practice-mode "practice")
;;;  (setq auto-mode-alist (cons '("\\.cmm\\'" . practice-mode) auto-mode-alist))

;;; Code:

(defvar practice-mode-syntax-table nil)
(defvar practice-mode-abbrev-table nil)
(defvar practice-mode-map nil)
(defvar practice-label-regexp nil)

(defgroup practice nil
  "Major mode for editing Lauterbach Trace32 Practice code under Emacs"
  :group 'languages)
  
(defcustom practice-indent-width 2
  "Level of indentation in Practice buffers."
  :type 'integer
  :group 'practice)

(if practice-mode-syntax-table
    ()
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\\ "\\" table)
    (modify-syntax-entry ?/ "." table)
    (modify-syntax-entry ?* "." table)
    (modify-syntax-entry ?+ "." table)
    (modify-syntax-entry ?- "." table)
    (modify-syntax-entry ?= "." table)
    (modify-syntax-entry ?\; "<" table)
    (modify-syntax-entry ?\n ">" table)
    (modify-syntax-entry ?< "." table)
    (modify-syntax-entry ?> "." table)
    (modify-syntax-entry ?\" "\"" table)
    (setq practice-mode-syntax-table table)))

(define-abbrev-table 'practice-mode-abbrev-table ())

(defun practice-mode-variables ()
  (set-syntax-table practice-mode-syntax-table)
  (setq local-abbrev-table practice-mode-abbrev-table)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat ";;\\|$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (make-local-variable 'paragraph-ignore-fill-prefix)
  (setq paragraph-ignore-fill-prefix t)
  (make-local-variable 'imenu-generic-expression)
  (setq imenu-generic-expression "^[a-z][a-zA-Z0-9_]+")
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'practice-indent-line)
  (make-local-variable 'comment-start)
  (setq comment-start ";")
  (make-local-variable 'comment-start-skip)
  (setq comment-start-skip ";+ *")
  (make-local-variable 'comment-column)
  (setq comment-column 48)
  (make-local-variable 'comment-indent-function)
  (setq comment-indent-function 'practice-comment-indent)
  (make-local-variable 'practice-label-regexp)
  (setq practice-label-regexp "[a-zA-Z0-9_]+:\\([ 	]\\|$\\)")
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults
	'(practice-font-lock-keywords              ;; KEYWORDS
	  nil                                      ;; KEYWORDSONLY
          t                                        ;; CASE-FOLD
          ((?: . "w") (?& . "w") (?/ . "w"))       ;; SYNTAX-ALIST
          nil)))                                   ;; SYNTAX-BEGIN


(defconst practice-font-lock-keywords
  (progn
    (let ((practice-keywords
           (regexp-opt
            '("BEEP" "CLOSE" "CMD" "CONT" "CONTINUE" "DO" "ELSE" "END" "ENDDO" "ENTER"
              "ENTRY" "GLOBAL" "GOSUB" "GOTO" "IF" "INKEY" "JUMPTO" "KEY" "LOCAL" "ON"
              "OPEN" "PRINT" "READ" "REPEAT" "RETURN" "RPT" "RUN" "SCREEN" "SCREEN.AL"
              "SCREEN.ALWAYS" "SCREEN.DISPLAY" "SCREEN.OFF" "SCREEN.ON" "STOP" "WAIT"
              "WHILE" "WRITE"))))
      (list
	;;
	;; Keywords 
	(concat "\\<\\(" practice-keywords "\\)\\>")
        ;; Boolean logic operators
        (cons "\\(:[aox]:\\|n:\\)"  'font-lock-warning-face)
        ;; Bitwise logic operators
        (cons "\\(#[aox]#\\|n#\\)"  'font-lock-warning-face)
        ;;
	;; Labels
	(cons (concat "\\<\\(" "[a-z0-9_]+:" "\\)\\>") 'font-lock-function-name-face)
	;;
	;; Macros (variables)
	(cons "\\(&[a-zA-Z0-9_]+\\)" 'font-lock-type-face)
	;;
	;; Fontify constants as references.
	;'("\\<\\(FALSE\\|NIL\\|NULL\\|TRUE\\)\\>" . font-lock-constant-face)
	)))
  "Highlighting for Trace32 Practice mode.")


(defun practice-mode-commands (map)
  (define-key map "\t" 'practice-indent-line)
  (define-key map "("  'practice-electric-indent)
  (define-key map ")"  'practice-electric-indent)
  (define-key map ":"  'practice-electric-indent))

(if practice-mode-map
    nil
  (setq practice-mode-map (make-sparse-keymap))
  (practice-mode-commands practice-mode-map))

;;;###autoload
(defun practice-mode ()
  "Major mode for editing Practice code for Lauterbach Trace32.
Commands:
\\{practice-mode-map}
Entry to this mode calls the value of `practice-mode-hook'
if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map practice-mode-map)
  (setq major-mode 'practice-mode)
  (setq mode-name "Practice")
  (practice-mode-variables)
  (run-hooks 'practice-mode-hook))

(defun practice-indent-line ()
  "Indent current line as Practice code."
  (interactive)
  (let ((indent (practice-indent-level))
	(pos (- (point-max) (point))) 
        beg)
    (beginning-of-line)
    (setq beg (point))
    (skip-chars-forward " \t")
    (if (zerop (- indent (current-column)))
	nil
      (delete-region beg (point))
      (indent-to indent))
    (if (> (- (point-max) pos) (point))
	(goto-char (- (point-max) pos)))
    ))

(defun practice-looking-at (&optional test)
  (interactive)
  (let ((result (cond
                 ((looking-at "([ 	]*$")
                  'open-paren)
                 ((looking-at ")[ 	]*\\($\\|while[ 	]\\)")
                  'close-paren)
                 ((looking-at "if[ 	]")
                  'if-statement)
                 ((looking-at "else[ 	]*$")
                  'else-statement)
                 ((looking-at "while\\([ 	]\\|$\\)")
                  'while-statement)
                 ((looking-at "repeat\\([ 	]\\|$\\)")
                  'repeat-statement)
                 ((looking-at "on\\([ 	]\\|$\\)")
                  'on-statement)
                 ((looking-at practice-label-regexp)
                  'label-statement)
                 (t
                  'other-statement))))
    (if test
        (equal result test)
      result)))

(defun practice-backward-line (&optional skip-blocks)
  "Go back 1 line in code, skipping empty lines, labels and optionally blocks."
  (let ((done nil))
    (while (not done)
      (if (and skip-blocks
               (looking-at ")"))
          (progn
            (forward-char 1)
            (backward-sexp)))
      (forward-line -1)
      (beginning-of-line)
      (if (bobp)
          (setq done t)
        (skip-chars-forward " \t")
        (if (not (or (looking-at "\n") 
                     (looking-at practice-label-regexp)
                     (and skip-blocks (looking-at ")"))))
            (setq done t)))))
  t)

(defun practice-previous-indent-level ()
  "Determine indentation of previous practice line."
  (practice-backward-line)
  (if (bobp)
      practice-indent-width
    (current-column)))

(defun practice-nested-statement-p (s)
  (or (equal s 'if-statement)
      (equal s 'else-statement)
      (equal s 'while-statement)
      (equal s 'repeat-statement)
      (equal s 'on-statement)))

(defun practice-unwind-nesting (&optional stop-statement)
  "Go out through a chain of nested statements. Leave point at the top most enclosing, or the at first instance of stop-statement, if any is specified."
  (interactive)
  (if (and (practice-nested-statement-p (practice-looking-at))
           (or (not stop-statement)
               (not (practice-looking-at stop-statement))))
      (progn
        (if (practice-looking-at 'else-statement)
            (while (not (practice-looking-at 'if-statement))
              (practice-backward-line)
              (if (practice-looking-at 'close-paren)
                  (progn
                    (forward-char 1)
                    (backward-sexp)
                    (practice-backward-line)))))
          
        (let ((previous 
               (save-excursion
                 (practice-backward-line)
                 (practice-looking-at))))
          (if (practice-nested-statement-p previous)
              (if (not (and (equal previous 'while-statement)
                            (save-excursion
                              (practice-backward-line)
                              (practice-find-repeat-macthing-while))))
                  (progn
                    (practice-backward-line)
                    (practice-unwind-nesting stop-statement))))))))

(defun practice-find-repeat-macthing-while ()
  "Placed on a while line, find the matching repeat statement, if any."
  (interactive)
  (practice-previous-line t)
  (if (practice-looking-at 'repeat-statement)
      t
    (if (practice-looking-at 'open-paren)
        nil
      (practice-previous-line t)
      (practice-unwind-nesting 'repeat-statement)
      (practice-looking-at 'repeat-statement))))
     
(defun practice-indent-level ()
  "Compute indentation level for current line of practice code."
  (save-excursion
    (beginning-of-line)
    (skip-chars-forward " \t")
    (let ((current (practice-looking-at)))
      (cond
       
       ;; These first cases depend only (immediately) on the current line
       ((bobp) 
        practice-indent-width)
       ;;
       ((equal current 'label-statement)
        0)
       ;;
       ((equal current 'close-paren)
        (forward-char 1)
        (backward-sexp)
        (current-column))
       ((and (equal current 'while-statement)
             (save-excursion
               (practice-find-repeat-macthing-while)))
        (practice-find-repeat-macthing-while)
        (current-column))
       ;; Indenting something which depends on previous code
       (t
        (let* ((ind (practice-previous-indent-level))
               (previous (practice-looking-at)))
          (cond
           ;; New block beginning
           ((equal previous 'open-paren)
                (+ ind practice-indent-width))

           ;; Else statement
           ((equal current 'else-statement)
            (if (or (equal previous 'close-paren)
                    (equal previous 'if-statement))
                ind
              (- ind practice-indent-width)))

           ;; A `while´ is possibly associated with a `repeat´
           ((equal previous 'while-statement)
            (if (not (practice-find-repeat-macthing-while))
                (if (equal current 'open-paren)
                    ind
                  (+ ind practice-indent-width))
              (practice-unwind-nesting)
              (current-column)))

           ;; Statements with optional block attached
           ((practice-nested-statement-p previous)
            (if (equal current 'open-paren)
                ind
              (+ ind practice-indent-width)))
           
           ;; Code following a single-statement block
           ((and (practice-backward-line t)
                 (practice-nested-statement-p (practice-looking-at)))
            (practice-unwind-nesting)
            (current-column))
           (t
            ind))
          ))
       ))))
  
(defun practice-electric-indent (arg)
  "Insert character and correct line's indentation."
  (interactive "P")
  (insert last-command-char)
  (practice-indent-line))

(provide 'practice-mode)

;;; practice.el ends here

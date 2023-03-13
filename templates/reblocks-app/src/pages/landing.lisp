(uiop:define-package #:{{name}}/pages/landing
  (:use #:cl)
  (:import-from #:reblocks/widget
                #:update
                #:render
                #:defwidget)
  (:import-from #:reblocks/dependencies
                #:get-dependencies)
  (:import-from #:reblocks/html
                #:with-html)
  (:import-from #:reblocks-ui
                #:ui-widget)
  (:import-from #:serapeum
                #:fmt)
  (:import-from #:reblocks-lass)
  (:import-from #:reblocks-ui/form
                #:with-html-form))
(in-package #:{{name}}/pages/landing)


(defwidget landing-page (ui-widget)
  ((name :initform nil
         :accessor user-name)))


(defun make-landing-page ()
  (make-instance 'landing-page))


(defmethod render ((widget landing-page))
  (flet ((set-name (&key user-name &allow-other-keys)
           (when (or (null user-name)
                     (string= user-name ""))
             (reblocks-ui/form:field-error "user-name"
                                           "Please, fill this input.")
             (reblocks-ui/form:form-error "Some errors were found, please, fix them."))
           (setf (user-name widget)
                 user-name)
           (update widget))
         (reset-name (&key &allow-other-keys)
           (setf (user-name widget)
                 nil)
           (update widget)))
    (cond
      ((user-name widget)
       (with-html-form (:post #'reset-name)
         (:p (fmt "Hello, ~A!" (user-name widget)))
         (:p (:input :type "submit" :class "button" :value "Reset"))))
      (t
       (with-html-form (:post #'set-name)
         (:p "Enter your name:")
         (:p (:input :type "text" :name "user-name"))
         (reblocks-ui/form:error-placeholder "user-name")
         (reblocks-ui/form:form-error-placeholder)
         (:p (:input :type "submit" :class "button" :value "Introduce myself")))))))


(defmethod get-dependencies ((widget landing-page))
  (list*
   (reblocks-lass:make-dependency
     `(.landing-page
       :border 2px solid "#733"
       :padding 1rem
       ((:and p :last-child)
        :margin-bottom 0)))
   (call-next-method)))

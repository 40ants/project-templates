(uiop:define-package #:{{name}}/app
  (:use #:cl)
  (:import-from #:reblocks)
  (:import-from #:reblocks-navigation-widget
                #:defroutes)
  (:import-from #:reblocks-prometheus
                #:prometheus-app-mixin)
  (:import-from #:reblocks/app
                #:defapp)
  (:import-from #:{{name}}/pages/landing
                #:make-landing-page)
  (:import-from #:reblocks/page
                #:init-page)
  (:import-from #:{{name}}/widgets/frame
                #:make-page-frame))
(in-package #:{{name}}/app)


(defapp app
  :subclasses (prometheus-app-mixin)
  :prefix "/")


(defroutes routes
    ;; ("/about/" (make-about-page))
    ("/" (make-page-frame
          (make-landing-page))))


(defmethod init-page ((app app) url-path expire-at)
  (make-routes))


(defmethod get-dependencies ((app app))
  "Whole application stylesheet"
  (list*
   ;; (reblocks-lass:make-dependency
   ;;   '(body
   ;;     :background "rgb(51, 53, 65)"
   ;;     :color "rgb(235, 236, 241)"))
   (call-next-method)))


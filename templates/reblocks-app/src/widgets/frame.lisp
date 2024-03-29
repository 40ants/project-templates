(uiop:define-package #:{{name}}/widgets/frame
  (:use #:cl)
  (:import-from #:reblocks-lass)
  (:import-from #:serapeum
                #:fmt)
  (:import-from #:reblocks/widget
                #:render
                #:defwidget)
  (:import-from #:reblocks-ui
                #:ui-widget)
  (:import-from #:reblocks-ui/form
                #:render-form-and-button)
  (:import-from #:reblocks/dependencies
                #:get-dependencies)
  (:import-from #:{{name}}/vars
                #:yandex-metrika-code
                #:*text-color*
                #:*dark-background*)
  (:export #:make-page-frame))
(in-package #:{{name}}/widgets/frame)


(defwidget frame-widget (ui-widget)
  ((content :initarg :content
            :reader content)
   (wide :initarg :wide
         :initform nil
         :reader widep)))


(defun make-page-frame (content &key wide)
  (make-instance 'frame-widget
                 :content content
                 :wide wide))


(defun make-yandex-metrika-code ()
  (let ((code (yandex-metrika-code)))
    (cond
      (code
       (serapeum:fmt "
<!-- Yandex.Metrika counter -->
<script type=\"text/javascript\" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();
   for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
   k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, \"script\", \"https://mc.yandex.ru/metrika/tag.js\", \"ym\");

   ym(~A, \"init\", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src=\"https://mc.yandex.ru/watch/~A\" style=\"position:absolute; left:-9999px;\" alt=\"\" /></div></noscript>
<!-- /Yandex.Metrika counter -->
"
                     code
                     code))
      ;; When no counter in settings
      (t
       ""))))


(defmethod render ((widget frame-widget))
  (let ((avatar-url "https://placekitten.com/30/30"))
    (reblocks/html:with-html
      (:raw (make-yandex-metrika-code))
      (:header
       (:div :class "navbar"
             (:div :class "main-logo"
                   (:div :class "title"
                         (:a :href "/"
                             "Example")))
             (:div :class "right-block"
                   ;; Profile icon
                   (if avatar-url
                       (:img :class "user-icon"
                             :src avatar-url)
                       (:a :class "login-link"
                           :href "/login"
                           "Войти")))))

      (:div :class (if (widep widget)
                       "wide-page-content"
                       "page-content")
            (render (content widget)))

      (:div :class "footer"
            (when (string-equal (reblocks/request:get-path)
                                "/")
              (:p :class "contacts"
                  "Если есть вопросы, пишите: "
                  (:a :href "https://t.me/svetlyak40wt"
                      (:img :src "https://altezza-store.ru/images/telegram.png"))))))))



(defmethod get-dependencies ((widget frame-widget))
  (list*
   (reblocks-lass:make-dependency
     `(body
       :background ,*dark-background*
       :color ,*text-color*
       
       (.frame-widget
        :display flex
        :flex-direction column
        :align-items center

        (.navbar
         :display flex
         :justify-content space-between
         :padding-left 1rem
         :padding-right 1rem
         (.main-logo
          :display flex
          :flex-direction column
          :flex-grow 10
          :text-align center
          (a :color ,*text-color*)

          (.title
           :font-size 3rem
           :font-weight bold))

         (.user-icon
          :width 32px
          :height 32px
          :margin-top 1rem)
         ((:or .user-icon
               .login-link)
          :margin-left 3em))
        
        (.page-content
         :width 80%
         :margin-left auto
         :margin-right auto)
        
        (.wide-page-content
         :width 100%)
        
        (header
         :width 100%
         (.main-menu :display flex
                     :align-items center
                     (a :margin-right 1rem))
         
         (input
          :margin 0))

        (.footer
         (.contacts
          :margin-bottom 7rem
          (img
           :height 1em)
          (a :color ,*text-color*))))))

   (reblocks-lass:make-dependency
     `(:media "(max-width: 600px)"
              (body
               (.frame-widget
                (.navbar
                 (.user-icon
                  :width 32px
                  :height 32px)
                 (.main-logo
                  (.motto :display none)))

                (.page-content
                 :width 100%
                 :margin 0
                 :padding-left 1rem
                 :padding-right 1rem)))))
   
   (call-next-method)))

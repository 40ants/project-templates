(uiop:define-package #:{{name}}/pets
  (:use #:cl)
  (:import-from #:openrpc-server
                #:define-rpc-method))
(in-package #:{{name}}/pets)


(defvar *pets*
  (make-hash-table))

(defvar *next-id* 0)


(defun get-new-id ()
  (incf *next-id*))


(defclass pet ()
  ((id :initarg :id
       :type integer
       :reader pet-id)
   (name :initarg :name
         :type string
         :reader pet-name)
   (breed :initarg :breed
          :type (or null string)
          :reader pet-breed)))


(openrpc-server:define-api (pets-api :title "Pets API"))


(define-rpc-method (pets-api create-pet) (name &key breed)
  (:summary "Short method docstring.")
  (:description "Lengthy description of the method.")
  (:param name string "Pet's name"
   :description "This is a long description of the parameter.")
  (:param breed (or null string)
          "A breed of the pet. Can be null.")
  (:result pet)
  
  (log:debug "Adding a new pet to the database")
  
  (let* ((new-id (get-new-id))
         (pet (make-instance 'pet
                             :id new-id
                             :name name
                             :breed breed)))
    (setf (gethash new-id *pets*)
          pet)
    pet))


(define-rpc-method (pets-api list-pets) ()
  (:result (list-of pet))
  (log:debug "Returning list of pets")
  (loop for pet being the hash-value of *pets*
        collect pet))

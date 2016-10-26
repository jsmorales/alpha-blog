class User < ActiveRecord::Base
	#indica que usuario tiene varios articulos
	#dependent: :destroy indica que todo lo relacionado a este
	#registro se elimina de igual forma
	has_many :articles, dependent: :destroy

	#antes de guardar se quiere que todo lo que sea de tipo email
	#lu guarde en la BD en minuscula, con un metodo llamado before save.
	before_save { self.email = email.downcase }

	#uniqueness valida que el valor sea único en la base de datos
	#en este caso lo hace eliminando el caso sensitivo osea que joel y Joel son lo mismo.
	validates :username, 
			  presence: true, 
			  uniqueness:{ case_sensitive: false}, 
			  length: {minimum: 3, maximum: 15}
	
    #se usa una expresion regular para validar el email.
    VALID_EMAIL_REGEX = /[\w]+@+[\w]+\.+[\w]+/i

	validates :email, 
			  presence: true,
			  uniqueness:{ case_sensitive: false}, 
			  length: {maximum: 100},
			  format: { with: VALID_EMAIL_REGEX }
	#encripta la contraseña
	has_secure_password
end
class User < ActiveRecord::Base
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
end
class Usuario < ActiveRecord::Base
before_save { self.usuario = usuario.downcase }
  VALID_USUARIO_REGEX = /\A(?=.{4,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/i
  validates :usuario, presence: true, length: {maximum: 15},
        format: { with: VALID_USUARIO_REGEX },
        uniqueness: { case_sensitive: false }


        has_secure_password
  validates :password, presence: true, length: {maximum: 255, minimum: 6}

  def Usuario.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end

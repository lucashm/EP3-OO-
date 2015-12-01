class Usuario < ActiveRecord::Base
  validates :usuario, presence: true, length: {maximum: 15}
  validates :senha, presence: true, length: {maximum: 255}
end

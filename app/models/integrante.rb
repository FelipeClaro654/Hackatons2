class Integrante < ActiveRecord::Base
  validates_presence_of :nome
  validates_presence_of :cpf
  validates_presence_of :email
  validates_uniqueness_of :cpf, message: "CPF já se encontra cadastrado!"
  validates_uniqueness_of :email, message: "Email já se encontra cadastrado!"
  validates :email, uniqueness: true

  belongs_to :team
end

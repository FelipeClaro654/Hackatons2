class Integrante < ActiveRecord::Base
  validates_presence_of :nome
  validates_presence_of :cpf
  validates_presence_of :email
  validates :nome, uniqueness: true
  validates :email, uniqueness: true
  validates :cpf, uniqueness: true

  belongs_to :team
end

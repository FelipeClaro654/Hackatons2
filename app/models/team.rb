class Team < ActiveRecord::Base
  has_many :integrantes, :dependent => :destroy
  belongs_to :tipo
  validates_presence_of :name, message: "Informe o nome do time!"
  accepts_nested_attributes_for :integrantes, reject_if: :all_blank, allow_destroy: true

  def integrantes_for_team
    collection = integrantes.where(team_id: id)
    collection.any? ? collection : integrantes.build
  end
end

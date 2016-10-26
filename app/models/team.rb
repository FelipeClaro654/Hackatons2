class Team < ActiveRecord::Base
  has_many :integrantes
  belongs_to :tipo
  accepts_nested_attributes_for :integrantes

  def integrantes_for_team
    collection = integrantes.where(team_id: id)
    collection.any? ? collection : integrantes.build
  end
end

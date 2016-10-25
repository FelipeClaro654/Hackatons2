class Team < ActiveRecord::Base
  has_many :integrantes
  has_one :tipo
  accepts_nested_attributes_for :integrantes

  def integrantes_for_team
    collection = integrantes.where(team_id: id)
    collection.any? ? collection : integrantes.build
  end
end

class AddTeamIdToIntegrantes < ActiveRecord::Migration
  def change
    add_column :integrantes, :team_id, :integer
  end
end

class AddTipoIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :tipo_id, :integer
  end
end

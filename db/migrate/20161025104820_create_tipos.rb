class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nome
      t.string :cor

      t.timestamps null: false
    end
  end
end

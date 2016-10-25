class CreateIntegrantes < ActiveRecord::Migration
  def change
    create_table :integrantes do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.text :obs

      t.timestamps null: false
    end
  end
end

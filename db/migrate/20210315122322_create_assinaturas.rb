class CreateAssinaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :assinaturas do |t|
      t.string :nome
      t.integer :sexo
      t.date :data_nascimento
      t.string :nome_mae
      t.string :nome_pai
      t.string :celular
      t.string :celular2
      t.string :email

      t.timestamps null: false
    end
  end
end

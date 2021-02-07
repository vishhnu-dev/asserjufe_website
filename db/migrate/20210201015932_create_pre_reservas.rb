class CreatePreReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_reservas do |t|
      t.string :nome_completo
      t.string :casa
      t.datetime :data_chegada
      t.datetime :data_saida
      t.string :email
      t.string :celular
      t.integer :dependentes
      t.integer :nao_dependentes
      t.integer :criancas
      t.timestamps null: false
    end
  end
end

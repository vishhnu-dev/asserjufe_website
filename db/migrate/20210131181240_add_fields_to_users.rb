class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nome_completo, :string, after: :email
    add_column :users, :data_nascimento, :date, after: :nome_completo
  end
end

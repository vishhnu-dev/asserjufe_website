class AddAtualizacaoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :atualizacao, :integer, after: :data_nascimento, default: 0
  end
end

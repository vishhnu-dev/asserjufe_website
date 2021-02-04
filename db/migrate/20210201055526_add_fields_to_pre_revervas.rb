class AddFieldsToPreRevervas < ActiveRecord::Migration[5.2]
  def change
    add_column :pre_reservas, :possui_dependentes, :string, after: :celular
    add_column :pre_reservas, :possui_nao_dependentes, :string, after: :dependentes
    add_column :pre_reservas, :possui_criancas, :string, after: :nao_dependentes
  end
end

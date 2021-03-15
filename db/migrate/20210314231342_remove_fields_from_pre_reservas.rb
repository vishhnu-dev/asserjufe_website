class RemoveFieldsFromPreReservas < ActiveRecord::Migration[5.2]
  def change
  	remove_column :pre_reservas, :possui_nao_dependentes
  	remove_column :pre_reservas, :nao_dependentes
  	remove_column :pre_reservas, :possui_criancas
  	remove_column :pre_reservas, :criancas

  	add_column :pre_reservas, :tipo_cliente, :integer, after: :email
  	add_column :pre_reservas, :numero_acompanhantes, :integer, after: :tipo_cliente
  	add_column :pre_reservas, :numero_criancas, :integer, after: :numero_acompanhantes
  	add_column :pre_reservas, :numero_dependentes, :integer, after: :numero_criancas
  end
end
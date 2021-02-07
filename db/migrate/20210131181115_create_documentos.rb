class CreateDocumentos < ActiveRecord::Migration[5.2]
  def change
    create_table :documentos do |t|
      t.string :estatuto
      t.string :tabela_valores
      t.string :regimento_interno
      t.string :regulamento

      t.timestamps null: false
    end
  end
end

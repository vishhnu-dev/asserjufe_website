class RemoveDescriptionFromPalavrasPresidente < ActiveRecord::Migration[5.2]
  def change
  	remove_column :palavras_presidente, :description
  	add_column :palavras_presidente, :video, :string
  end
end

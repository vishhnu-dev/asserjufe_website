class CreateNoticias < ActiveRecord::Migration[5.2]
  def change
    create_table :noticias do |t|
      t.string :title
      t.text :description
      t.string :imagem
      t.string :video
      t.string :doc

      t.timestamps
    end
  end
end

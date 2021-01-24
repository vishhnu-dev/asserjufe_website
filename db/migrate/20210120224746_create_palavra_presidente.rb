class CreatePalavraPresidente < ActiveRecord::Migration[5.2]
  def change
    create_table :palavras_presidente do |t|
      t.text :description
    end
  end
end

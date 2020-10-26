class CreateContatos < ActiveRecord::Migration[5.2]
  def change
    create_table :contatos do |t|
    	t.string :email
    	t.string :nome
    	t.string :assunto
    	t.string :telefone
    	t.text :mensagem

    	t.timestamps null: false
    end
  end
end

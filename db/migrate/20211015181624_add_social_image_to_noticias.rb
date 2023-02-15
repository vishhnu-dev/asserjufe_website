class AddSocialImageToNoticias < ActiveRecord::Migration[5.2]
  def change
    add_column :noticias, :social_image, :string, after: :imagem
  end
end

class AddUrlToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :url, :string, after: :imagem
  end
end

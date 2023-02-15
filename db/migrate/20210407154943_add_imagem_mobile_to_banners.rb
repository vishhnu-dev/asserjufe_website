class AddImagemMobileToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :imagem_mobile, :string
  end
end

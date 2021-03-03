class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.integer :status, default: 0
      t.string :imagem

      t.timestamp null: false
    end
  end
end

class Banner < ApplicationRecord
	mount_uploader :imagem, BannerUploader
	mount_uploader :imagem_mobile, BannerUploader

	validates :status, :imagem, :imagem_mobile, :url, presence: true

	enum status: [:ativo, :inativo]
end

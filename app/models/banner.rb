class Banner < ApplicationRecord
	mount_uploader :imagem, BannerUploader

	validates :status, :imagem, :url, presence: true

	enum status: [:ativo, :inativo]
end

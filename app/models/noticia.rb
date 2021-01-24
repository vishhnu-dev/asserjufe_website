class Noticia < ApplicationRecord
	mount_uploader :imagem, ImagemUploader
	mount_uploader :video, VideoUploader
	mount_uploader :doc, DocUploader

	validates :title, presence: { message: 'não pode ficar em branco.' }
	validates :description, presence: { message: 'não pode ficar em branco.' }
end

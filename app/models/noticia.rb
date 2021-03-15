class Noticia < ApplicationRecord
	mount_uploader :imagem, ImagemUploader
	mount_uploader :video, VideoUploader
	mount_uploader :doc, DocUploader

	validates :title, presence: { message: 'não pode ficar em branco.' }
	validates :description, presence: { message: 'não pode ficar em branco.' }

	before_save :set_slug

	private
		def	set_slug
			self.slug = self.title.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
			self.slug = self.slug.gsub(/[.' ']/, '.' => ' ', ' ' => '-')
		end
end

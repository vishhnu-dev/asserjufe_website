class Noticia < ApplicationRecord
	require 'fastimage'

	mount_uploader :imagem, ImagemUploader
	mount_uploader :social_image, SocialNewsUploader
	mount_uploader :video, VideoUploader
	mount_uploader :doc, DocUploader

	validates :title, presence: { message: 'não pode ficar em branco.' }, uniqueness: true
	validates :description, presence: { message: 'não pode ficar em branco.' }
	validate :validates_fb_size, if: :has_fb_img

	before_save :set_slug, only: :create

	def	set_slug
		# Perform transliteration to replace non-ascii characters with an ascii
	    # character
	    value = self.title.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
	    # Remove single quotes from input
	    value.gsub!(/[']+/, '')
	    # Replace any non-word character (\W) with a space
	    value.gsub!(/\W+/, ' ')
	    # Remove any whitespace before and after the string
	    value.strip!
	    # All characters should be downcased
	    value.downcase!
	    # Replace spaces with dashes
	    value.gsub!(' ', '-')
	    # Return the resulting slug
	    self.slug = value + "-#{rand(10000)}"
	end

	def validates_fb_size
		img_size = FastImage.size(self.social_image.path)
		if img_size.present?
			if img_size[0] != 206
				errors.add(:social_image, "não pode ser superior a 206px de largura(width).".html_safe)
			end
			if img_size[1] != 206
				errors.add(:social_image, "não pode ser superior a 206px de altura(height).".html_safe)
			end
		end
	end

	def has_fb_img
		self.social_image.present?
	end
end

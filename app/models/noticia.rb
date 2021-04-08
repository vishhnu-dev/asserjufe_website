class Noticia < ApplicationRecord
	mount_uploader :imagem, ImagemUploader
	mount_uploader :video, VideoUploader
	mount_uploader :doc, DocUploader

	validates :title, presence: { message: 'não pode ficar em branco.' }, uniqueness: true
	validates :description, presence: { message: 'não pode ficar em branco.' }

	before_save :set_slug

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
end

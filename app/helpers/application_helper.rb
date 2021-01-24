module ApplicationHelper
	def label_status text, color
		content_tag(:small, text.upcase, class: "label bg-#{color}")
	end
end

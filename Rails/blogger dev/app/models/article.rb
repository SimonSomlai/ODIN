class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image, styles: {small: "150x150>", med: "250x250>", large: "1000x400>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/png", "image/jpeg"]

	def tag_list
	self.tags.collect do |tag|
		tag.name
	end.join(", ")
	end

	def tag_list=(tags_string)
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
end
end

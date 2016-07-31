class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :author, :title, :image, :body, presence: true
	before_create :title_case

	protected
		def title_case
			self.title = self.title.downcase.titleize
		end
end

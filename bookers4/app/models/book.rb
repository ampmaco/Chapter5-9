class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :opinion, presence: true, length: { maximum: 200, too_long: "This is the error. Please enter within 200 characters"}



end

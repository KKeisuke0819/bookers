class Book < ApplicationRecord
	validates :title, :body, presence: true, length: { minimum: 1 }
end

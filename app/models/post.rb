class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {
        in: %w(Fiction Non-Fiction)
      }

    validate :title_is_clickbait

    def title_is_clickbait
        if self.title == "True Facts"
            errors.add(:title, "We cant have True Facts as the title")
        end
    end

end

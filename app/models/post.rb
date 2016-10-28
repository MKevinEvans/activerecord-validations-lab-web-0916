class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 50 }
	validate :clickbait
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  # def must_be_clickbait
  #    clickbait = ["Won't Believe", "Secret", "Top", "Guess"].any? do |phrase|
  #      title.include?(phrase) if !title.nil?
  #          end
          
  #  end
	def clickbait
		clickbaity = ["Won't Believe", "Secret", "Top ", "Guess"].any? do |phrase|
			title.include?(phrase) unless !title
			end

		unless clickbaity
      	  errors.add(:title, "is not clickbait")
  		end
  	end
end

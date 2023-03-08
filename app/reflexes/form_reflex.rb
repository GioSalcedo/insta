class FormReflex < ApplicationReflex
	def create
		puts element.dataset["post-id"]
    puts element.dataset["comment-id"]
	end
end
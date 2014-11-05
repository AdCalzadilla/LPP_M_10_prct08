require_relative 'question'

class Simple_Selection < Question
	attr_reader :ask,:answers

	def initialize(ask, answers)
		super(ask)
		@answers = answers
	end

	def answers_to_s
		cadena = ""
		@answers.each do |m,i| 
			cadena += "#{m})#{i}\n"
    	end
    	cadena
	end


	def to_s
		cadena = ""
		cadena << super.to_s
		@answers.each do |m,i| 
			cadena += "#{m})#{i}\n"
    	end
		cadena
	end
end

require_relative 'question'

class TrueFalse < Question
	def initialize(ask, difficulty= 0)
		@answers = { 
			"a" => "Cierto",
			"b" => "Falso"
		}
		super(ask, difficulty)
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
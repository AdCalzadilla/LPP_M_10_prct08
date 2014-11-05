require_relative 'question'

class TrueFalse < Question
	def initialize(ask)
		@answers = { 
			"a" => "Cierto",
			"b" => "Falso"
		}
		super(ask)
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
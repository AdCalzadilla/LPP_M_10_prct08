#module Exam
	class Question

		include Comparable

		attr_reader :ask, :difficulty

		def initialize(ask, difficulty = 0)
			@ask = ask
			@difficulty = difficulty
		end

		def to_s
			cadena = "#{@ask}\n"
			cadena
		end

		def <=>(other)
    		return nil unless other.is_a? Question
    		@difficulty <=> other.difficulty
  		end
	end
#end

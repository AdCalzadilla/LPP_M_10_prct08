#module Exam
	class Question

		include Comparable

		attr_reader :ask

		def initialize(ask)
			@ask = ask
		end

		def to_s
			cadena = "#{@ask}\n"
			cadena
		end
	end
#end

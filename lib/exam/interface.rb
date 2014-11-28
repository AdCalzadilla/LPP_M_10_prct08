require_relative 'examen'

class Interface
	#attr_reader :exam
	
	def initialize(exam)
		@theExam = exam
		@userAnswers = Array.new(@theExam.numQuestion)
		@numRight = 0
	end

	def make_exam
		i = 0
		puts @theExam.printQuestion
		while @userAnswers.size() > i
			puts @theExam.printQuestion
			print "--> Respuesta = "
			@userAnswers[i] = gets.chomp
			if @userAnswers[i] == @theExam.examAnswers[i]
				@numRight += 1
			end
			i += 1
		end
		puts " \n---- Resultado del examen ------ "
		if pass
			puts " ## --> Aprobado."
		else
			puts " ## --> Suspendido."
		end
	end

	def reverse_exam
		@theExam.myExam.reverse_each.map{|e| e}
	end

	private
	def pass
		@userAnswers.size()/2 < @numRight
	end
end

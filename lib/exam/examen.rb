require_relative 'Simple_Selection'
require_relative 'list'
require_relative 'trueFalse'

class Examen

	attr_reader :examAnswers, :myExam

	def initialize(questions,answers)
		@myExam = List.new("\n\tLenguajes y Paradigmas de la programación.\n\t\tExamen práctico.\n\n")
		@myExam.add_many(questions)
		@examAnswers = answers
	end

	def to_s
		@myExam.to_s
	end

	def printQuestion
		@myExam.pop()
	end

	def numQuestion
		@examAnswers.length
	end
end
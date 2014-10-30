require 'spec_helper'
require 'exam'

describe Exam do
	before :each do

		@options1 = {
			"a" => "Cristiano Ronaldo",
			"b" => "Bale",
			"c" => "Isco",
			"d" => "Modric"
		}

		@sS1 = Simple_Selection.new("¿Quien va a ser el balon de oro?",@options1)
		@myNode =Node.new(3,2)
	end

	describe "# Simple_Selection." do
		
		it "Debe existir una pregunta." do
			@sS1.ask.should eq("¿Quien va a ser el balon de oro?")
		end
		it "Se debe invocar un metodo para obtener la pregunta." do
			#La expectativa tiene el mismo código porque para ver si existía la pregunta cree el attr_reader.(me fije en la clase Point)
			@sS1.ask.should eq("¿Quien va a ser el balon de oro?")
		end
		it "Deben existir opciones de respuesta y se debe invocar a un metodo para obtener las opciones de respuesta." do
			#Veo que existen y las muestro por pantalla.
			@sS1.answers_to_s.should eq("a)Cristiano Ronaldo\nb)Bale\nc)Isco\nd)Modric\n")
		end
		it "Se deben mostrar por la consola formateada la pregunta y las opciones de respuesta." do
			@sS1.to_s.should eq("¿Quien va a ser el balon de oro?\na)Cristiano Ronaldo\nb)Bale\nc)Isco\nd)Modric\n")
		end  
 	end

 	describe "# Node." do
 		it "Debe existir un Nodo de la lista con sus datos y su siguiente."
 			@myNode.value.should eq(3)
 		end
 	end
end
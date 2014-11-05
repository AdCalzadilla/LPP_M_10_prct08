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
		@myNode = Node.new(3,2)
		@myList = List.new(5)
		@myArray = [3,5,8,2,7,10]
		#@myTrueFalseAsk = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.")
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
 		it "Debe existir un Nodo de la lista con sus datos y su siguiente." do
 			@myNode.value.should eq(3)
 			@myNode.next.should eq(2)
 		end
 	end

 	describe "# List" do
 		it "Se extrae el primer elemento de la lista." do
 			@myList.pop
 		end
 		it "Se puede insertar un elemento." do
 			@myList.add(8)
 		end
 		it "Se pueden insertar varios elemnetos." do
 			@myList.add_many(@myArray)
 		end
 		it "Debe existir una Lista con su cabeza." do
 			@myList.head.should eq("5")
 		end
 		it "Prueba para la siguiente relaciónn de preguntas de selección simple." do
 			@pregunta1 = "1.-)¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\tdef pots\n\t\t@nice\n\tend\nend\n\nxyz = Xyz.new\np xyz.pots"
			@optionsP1 = {
				"a" => "#<Xyz:0xa000208>",
				"b" => "nil",
				"c" => "0",
				"d" => "Ninguna de las anteriores"
			}
			@pregunta2 = "2.-)La siguiente definicion de hash en Ruby es valida\nhash_raro = {\n\t[1,2,3] => Object.new(),\n\tHash.new => :toto\n}"
			@optionsP2 = {
				"a" => "Cierto",
				"b" => "Falso",
			}
			@pregunta3 = "3.-)¿Cual es la salida del siguiente codigo en Ruby?\nclass Array\n\tdef say_hi\n\t\t\"HEY!\"\n\tend\nend\n\np [1, \"bob\"].say_hi"
			@optionsP3 = {
				"a" => "1",
				"b" => "Bob",
				"c" => "HEY!",
				"D" => "Ninguna de las anteriores"
			}
			@pregunta4 = "4.-)¿Cual es el tipo del objeto en el siguiente codigo en Ruby?\nclass Objeto\nend"
			@optionsP4 = {
				"a" => "Una instancia de la clase Class",
				"b" => "Una constante",
				"c" => "Un objeto",
				"D" => "Ninguna de las anteriores"
			}
			@pregunta5 ="5.-)Es apropiado que una clase Tablero herede de una clase juego."
			@optionsP5 ={
				"a" => "Cierto",
				"b" => "Falso"
			}

 			@pS1 = Simple_Selection.new(@pregunta1,@optionsP1)
 			@pS2 = Simple_Selection.new(@pregunta2,@optionsP2)
 			@pS3 = Simple_Selection.new(@pregunta3,@optionsP3)
 			@pS4 = Simple_Selection.new(@pregunta4,@optionsP4)
 			@pS5 = Simple_Selection.new(@pregunta5,@optionsP5)

 			myExam = List.new(@pS1)
 			myExam.add(@pS2)
 			myExam.add(@pS3)
 			myExam.add(@pS4)
 			myExam.add(@pS5)
 		end
 	end
=begin
 	describe "# TrueFalse." do
 		it "Debe existir una pregunta cuya respuesta sea: Cierto o Falso." do
 			@myTrueFalseAsk.to_s.should eq("Es apropiado que una clase Tablero herede de una clase Juego.\na)Cierto\nb)Falso")
 		end
 	end
=end
end




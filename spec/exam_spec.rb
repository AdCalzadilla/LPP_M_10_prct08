#enconding: utf-8
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

		@sS1 = Simple_Selection.new("Quien va a ser el balon de oro?",@options1)
		@myNode = Node.new(3,nil,2)
		@myList = List.new(5)
		@myArray = [3,5,8,2,7,10]
		@myTrueFalseAsk = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.")
	end

	describe "# Simple_Selection." do
		
		it "Debe existir una pregunta." do
			@sS1.ask.should eq("Quien va a ser el balon de oro?")
		end
		it "Se debe invocar un metodo para obtener la pregunta." do
			#La expectativa tiene el mismo codigo porque para ver si existia la pregunta cree el attr_reader.(me fije en la clase Point)
			@sS1.ask.should eq("Quien va a ser el balon de oro?")
		end
		it "Deben existir opciones de respuesta y se debe invocar a un metodo para obtener las opciones de respuesta." do
			#Veo que existen y las muestro por pantalla.
			@sS1.answers_to_s.should eq("a)Cristiano Ronaldo\nb)Bale\nc)Isco\nd)Modric\n")
		end
		it "Se deben mostrar por la consola formateada la pregunta y las opciones de respuesta." do
			@sS1.to_s.should eq("Quien va a ser el balon de oro?\na)Cristiano Ronaldo\nb)Bale\nc)Isco\nd)Modric\n")
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
 		it "Prueba para la siguiente relacionn de preguntas de seleccion simple." do
 			@pregunta1 = "1.-)Cual es la salida del siguiente codigo Ruby?\nclass Xyz\n\tdef pots\n\t\t@nice\n\tend\nend\n\nxyz = Xyz.new\np xyz.pots"
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
			@pregunta3 = "3.-)Cual es la salida del siguiente codigo en Ruby?\nclass Array\n\tdef say_hi\n\t\t\"HEY!\"\n\tend\nend\n\np [1, \"bob\"].say_hi"
			@optionsP3 = {
				"a" => "1",
				"b" => "Bob",
				"c" => "HEY!",
				"D" => "Ninguna de las anteriores"
			}
			@pregunta4 = "4.-)Cual es el tipo del objeto en el siguiente codigo en Ruby?\nclass Objeto\nend"
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

 	describe "# TrueFalse." do
 		it "Debe existir una pregunta cuya respuesta sea: Cierto o Falso." do
 			@myTrueFalseAsk.to_s.should eq("Es apropiado que una clase Tablero herede de una clase Juego.\na)Cierto\nb)Falso\n")
 		end
 	end

 	describe "# Simple_Selection heredado de Question." do
 		it "Debe existir una pregunta de respuestas simples (prct07)." do
 			@optionsSs2={
 				"a" => "Una instancia de la clase Class",
				"b" => "Una constante",
				"c" => "Un objeto",
				"D" => "Ninguna de las anteriores"
 			}
 			@sS2 = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend\n",@optionsSs2)
 		end
 	end

 	describe "# Ejemplo del enunciado de la practica 7. (Lista doblemente enlazada, Herencia en las preguntas)." do
 		it "Introduzco en una lista doblemente enlazada una pregunta de seleccion simple y otra de verdadero o falso." do
 			myAskTrue = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.")
			myNormalQuestion = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend",@optionsP3)
			MyNewExam = List.new(myNormalQuestion)
			MyNewExam.add(myAskTrue)
 		end
 	end

 	describe "# Comprobar que myAskTrue, myNormalQuestion son de clases diferentes." do
 		it "Creo varias preguntas y con el metodo is_a pregunto que tipo de clase es." do
 			myAskTrue = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.")
 			myNormalQuestion = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend",@optionsP3)
 			expect(myAskTrue.is_a? TrueFalse).to eq(true)
 			expect(myNormalQuestion.is_a? Simple_Selection).to eq(true)
 		end
 	end

 	describe "# Practica 8: Comprobar que el los metodos comparable se han introducido correctamente." do
 		it "Creo dos preguntas y comparo su dificultad." do
 			myAskTrue = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.",8)
			myNormalQuestion = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend",@optionsP3,3)
			myThirdQuestion = TrueFalse.new("Rellenando la lista.",5)
			x = myAskTrue > myNormalQuestion
			expect(x).to eq(true)
			expect(myAskTrue < myNormalQuestion).to eq(false)
			expect(myAskTrue >= myNormalQuestion).to eq(true)
			expect(myAskTrue <= myNormalQuestion).to eq(false)
			expect(myAskTrue == myNormalQuestion).to eq(false)
			#Metodo between? no se si funciona.
			expect(myAskTrue.between?(myNormalQuestion, myThirdQuestion)).to eq(false)
		end
	end

	describe "# Practica 8: Comprobar el metodo Enumerable en la clase List." do
		it "Creo dos preguntas, las introduzco en una lista y miro cual tiene mayor dificultad." do
			myAskTrue = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.",8)
			myNormalQuestion = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend",@optionsP3,3)
			MyNewExam = List.new(myNormalQuestion)
			MyNewExam.add(myAskTrue)
			x = MyNewExam.all?
			expect(x).to eq(true)
		end

		it "# Practica 8: Segunda comprobacion del metodo Enumerable en la clase List" do
			myNumberList = List.new(5)
			myNumberList.add_many([2,5,3,9,6,7,1])
			expect(myNumberList.max).to eq(9)
		end

		it "# Practica 8: Tercera comprobacion del metodo Enumerable introduciendo preguntas a la lista." do
			myAskTrue = TrueFalse.new("Es apropiado que una clase Tablero herede de una clase Juego.",8)
			myNormalQuestion = Simple_Selection.new("Cual es el tipo de objeto en el siguiente codigo en Ruby?\n\tclass Objeto\n\tend",@optionsP3,3)
			MyNewExam = List.new(myNormalQuestion)
			MyNewExam.add(myAskTrue)
			x = MyNewExam.all?
			expect(x).to eq(true)
			y = MyNewExam.max
			expect(y.to_s).to eq("Es apropiado que una clase Tablero herede de una clase Juego.\na)Cierto\nb)Falso\n")
		end
	end

	describe "# Practica 9: Creacion de la clase Examen." do
		it "# Practica 9: creo un objeto de la clase Examen. Compruebo que se introducen las respuestas y que las preguntas son de tipo List." do
			pS1 = Simple_Selection.new(@pregunta1,@optionsP1)
			pT1 = TrueFalse.new("2.-) Es apropiado que una clase Tablero herede de una clase Juego.",8)
			pT2 = TrueFalse.new("3.-) En Ruby todo es un objeto.",2)

			myQuestions = [pS1,pT1,pT2]
			myAnswers = ["b","b","a"]
			myFirstExam = Examen.new(myQuestions,myAnswers)
			z = myFirstExam.examAnswers.is_a?(Array)
			expect(z).to eq(true)
			y = myFirstExam.myExam.is_a?(List)
			expect(y).to eq(true)
		end

		it "# Practica 9: Creacion de la clase interfaz donde el usuario puede hacer el examen." do
			pS1 = Simple_Selection.new(@pregunta1,@optionsP1)
			pT1 = TrueFalse.new("2.-) Es apropiado que una clase Tablero herede de una clase Juego.",8)
			pT2 = TrueFalse.new("3.-) En Ruby todo es un objeto.",2)

			myQuestions = [pS1,pT1,pT2]
			myAnswers = ["b","b","a"]

			mySecondExamen = Examen.new(myQuestions,myAnswers)

			interfaceExamen = Interface.new(mySecondExamen)

			x = interfaceExamen.is_a?Interface
			expect(x).to eq(true) 
		end
	end

	describe "# Practica 10: Programacion funcional." do
		it "# Practica 10: Invertir el orden usando programacion funcional." do
			pS1 = Simple_Selection.new(@pregunta1,@optionsP1)
			pT1 = TrueFalse.new("2.-) Es apropiado que una clase Tablero herede de una clase Juego.",8)
			pT2 = TrueFalse.new("3.-) En Ruby todo es un objeto.",2)

			myQuestions = [pS1,pT1,pT2]
			myAnswers = ["b","b","a"]

			mySecondExamen = Examen.new(myQuestions,myAnswers)

			interfaceExamen = Interface.new(mySecondExamen)

			x = interfaceExamen.reverse_exam.class
			expect(x).to eq(Array)
		end
	end

	describe "# Practica 11." do
		it "# Creacion de la clase quiz." do
			quiz = Quiz.new do
            	questionExam "2+2",
                wrong => "17",
                wrong => "25",
                right => "4"
        	end

        	expect(quiz.to_s).to eq("Examen Lenguaje y paradigmas de programacion.\n#{'=' * 45}\n\n1) 2+2\n17\n25\n4\n")
		end
	end

	describe 'Practica 12: Naranjo' do
		it 'Se crea una instancia de la clase Naranjo' do
			@naranjero1 = Naranjo.new
	        expect(@naranjero1.age).to eq(0)
	        expect(@naranjero1.hight).to eq(0)
	        expect(@naranjero1.numNaranjas).to eq(0)
		end

		it 'Compruebo la edad' do
			@naranjo1 = Naranjo.new

			@threadNaranjo = Thread.new do
			    20.times do
			      @naranjo1.uno_mas
     			end
     		end
     		@threadNaranjo.join
   			expect(@naranjo1.age).to eq(20)
		end

		it 'Recolecta de naranjas antes de los 5 anios' do
			naranjo2 = Naranjo.new

			threadNaranjo2 = Thread.new do
				4.times do
					naranjo2.uno_mas
				end
			end
			threadNaranjo2.join
			expect(naranjo2.recolectar_una).to eq("No hay fruta")
		end
	end
end




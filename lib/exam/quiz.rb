
class Quiz

	def initialize(&block)
		@exam_Questions = []
    @exam_Answers = []
    @counter = 0

		if block_given?  
      		if block.arity == 1
        		yield self
      		else
       			instance_eval &block 
      		end
    end

	end

	def to_s
    output = "Examen Lenguaje y paradigmas de programacion."
    output << "\n#{'=' * 45}\n\n"
    @exam_Questions.each_with_index do |q,i|
      puts @exam_Answers
      output << "#{i+1}" << ") "<< q <<"\n"
      @exam_Answers[i].each do |elm|
        output << elm << "\n"
      end 
    end
    output
  end

  def questionExam(question,answers = {})
      @exam_Questions << question
      puts answers
      @exam_Answers[@exam_Answers.size] =[]
      answers.each do |key, val|
          @exam_Answers[(@exam_Answers.size)-1] << val
      end
      puts @exam_Answers
  end

  def wrong
    @counter += 1
    [@counter, :wrong]
  end

  def right
    @counter+= 1
    [@counter, :right]
  end
end
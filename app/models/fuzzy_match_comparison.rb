class FuzzyMatchComparison
  attr_reader :score, :correct_answer
  
  def initialize(correct_answer, submission_answer)
    @correct_answer = correct_answer
    jarow = FuzzyStringMatch::JaroWinkler.create( :pure )
    @score = jarow.getDistance(correct_answer, submission_answer)
  end

  def response
    if score < 0.9 
      "Sorry your answer is so very wrong. 
       The answer is #{correct_answer}!"      
    elsif score < 1 && score > 0.9
      "Correct but you need spelling lessons! 
        Hint: correct_answer is spelled 
        #{correct_answer.chars}"
    elsif score == 1
      "Good job! You got it right!"
    end
  end
end

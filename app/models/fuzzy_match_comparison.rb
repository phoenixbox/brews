class FuzzyMatchComparison
  attr_reader :score, :correct_answer

  def initialize(correct_answer, submission_answer)
    @correct_answer = correct_answer
    jarow = FuzzyStringMatch::JaroWinkler.create( :pure )
    @score = jarow.getDistance(correct_answer.upcase, submission_answer.upcase)
  end

  def answer_response
    if incorrect?
      "Wrong. The correct answer is '#{correct_answer}'."
    elsif mostly_correct?
      "Correct but you need spelling lessons! 
        Hint: #{correct_answer.chars}"
    elsif correct?
      "Good job! You got it right!"
    end
  end

  def incorrect?
    score < 0.8
  end

  def mostly_correct?
    score < 1 && score > 0.8
  end

  def correct?
    score == 1
  end

  def score_points?
    mostly_correct? || correct?
  end
end

require 'spec_helper'

describe "Fuzzy match evaluates submissions" do 

  context "answer is correct" do
    let(:fuzzy_correct){FuzzyMatchComparison.new("answer", "answer")}

    it "correct? is true" do
      expect(fuzzy_correct.correct?).to eq(true)
    end
    
    it "score_points? is true" do 
      expect(fuzzy_correct.score_points?).to eq(true)
    end
  end

  context "answer is mostly correct" do
    let(:fuzzy_mostly_correct){FuzzyMatchComparison.new("answer", "ansur")}

    it "mostly_correct? is true" do 
      expect(fuzzy_mostly_correct.mostly_correct?).to eq(true)
    end

    it "score_points? is true" do 
      expect(fuzzy_mostly_correct.mostly_correct?).to eq(true)
    end
  end

  context "answer is incorrect" do
    let(:fuzzy_incorrect){FuzzyMatchComparison.new("answer", "dolphin")}

    it "incorrect? is true" do 
      expect(fuzzy_incorrect.incorrect?).to eq(true)
      expect(fuzzy_incorrect.correct?).to eq(false)
      expect(fuzzy_incorrect.mostly_correct?).to eq(false)
    end

    it "does not set score_points? true" do 
      expect(fuzzy_incorrect.score_points?).to eq(false)
    end
  end


end
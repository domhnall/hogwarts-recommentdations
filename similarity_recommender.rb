class SimilarityRecommender
  attr_reader :class_scores

  def initialize(class_scores = {})
    @class_scores = class_scores
  end

  def students
    class_scores.keys
  end

  def scores_for(student)
    class_scores.fetch(student, {})
  end
end

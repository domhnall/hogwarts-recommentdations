require_relative './similarity_recommender'
require 'debug'

class EuclideanRecommender < SimilarityRecommender

  def get_recommendations(person)
    class_scores[person].inject({}) do |memo, (class_name, score)|
      next memo if score # We only want to recommend classes for which we have no score registered
      total_similarity = 0
      memo[class_name] = class_scores.keys.inject(0) do |avg, other_person|
        next avg unless class_scores[other_person][class_name]
        similarity = similarity(person, other_person)
        total_similarity += similarity
        avg += class_scores[other_person][class_name] * similarity
      end
      memo[class_name] = memo[class_name] / total_similarity
      memo
    end
  end

  def top_k_matches(person, k = class_scores.size)
    class_scores.keys.inject({}) do |scores, other_person|
      next scores if other_person == person
      scores[other_person] = similarity(person, other_person)
      scores
    end.compact.sort_by do |_key, value|
      -1*value
    end[0..k-1].to_h
  end

  private

  # The similarity score lies in the closed interval [0, 1].
  # A score of 1 indicates that the items are identical.
  # A score of 0 indicates that they are infinitely distant.
  def similarity(person, other_person)
    1.0/(1.0 + distance(person, other_person))
  end

  def distance(person, other_person)
    return 0.0 if person == other_person
    squares = class_scores[person].map do |class_name, pref|
      next unless pref && class_scores[other_person][class_name]
      (class_scores[other_person][class_name]-pref)**2
    end.compact
    if squares.empty?
      10_000 # dummy large value if no overlapping scores
    else
      Math.sqrt(squares.sum) / squares.size
    end
  end
end

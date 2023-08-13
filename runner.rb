require 'debug'
require_relative './hogwarts_class_scores'
require_relative './recommender'
require_relative './metrics'

#puts scores_as_html(true)

student = ARGV[0]
puts "Running model for #{student}"

recommender = Recommender.new(CLASS_SCORES, Metrics.method(:euclidean_distance))
#recommender = Recommender.new(CLASS_SCORES, Metrics.method(:cosine_distance))
puts "  Top 3 matches for #{student}:"
puts recommender.top_k_matches(student, 3)

puts "  Estimated class scores for #{student}:"
puts recommender.get_recommendations(student)

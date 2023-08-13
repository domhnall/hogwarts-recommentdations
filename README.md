# Implementing a NN recommendation model in ruby

This small repo is intended to act as a demonstration of how we can 
build a recommendation model, based on nearest neighbours.
This model is applied to fabricated data on student scores for
different classes in Hogwarts (see `hogwarts_class_scores.rb`).
The example data is whimsical, but the fundamentals of the algorithm
are sound.

To run the model and get predicted scores for Ginny Weasley you can run:

> ruby runner.rb "Ginny Weasley"


Please refer to the [blog
article](https://www.vector-logic.com/blog/posts/implementing-nearest-neighbout-recommendations-in-ruby)
for a more detailed discussion of how this recommendation model is
implemented.

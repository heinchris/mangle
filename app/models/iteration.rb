class Iteration < ActiveRecord::Base
  has_many :stories

  def total_points
    stories.inject(0) {|sum, x| sum + x.estimate}
  end
end

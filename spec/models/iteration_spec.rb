require 'spec_helper'

describe Iteration do
  it "should be able to have stories assigned to this iteration" do
    iteration = Iteration.create!(:name => "iteration1")
    story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
    story1.iteration = iteration
    iteration.stories.should be_empty
    story1.save!
    iteration = Iteration.find(iteration.id)
    iteration.stories.should_not be_empty
  end
  describe "total_points" do
    it "should show all the aggregate of the estimates of the stories assigned to it" do
      iteration = Iteration.create!(:name => "iteration1")
      story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
      story1.iteration = iteration
      iteration.stories.should be_empty
      story1.save!
      iteration = Iteration.find(iteration.id)
      iteration.total_points.should == 3
    end

    it "should return 0 if no stories are assigned" do
      iteration = Iteration.create!(:name => "iteration1")
      story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
      iteration.total_points.should == 0
    end
  end

end

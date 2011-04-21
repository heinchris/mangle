require 'spec_helper'

describe Story do

  describe "list" do
    it "listing should be ordered by priority" do
      story3 = Story.create!(:name => "Chris3", :narrative => "Narrative3", :estimate => 3, :priority => 3)
      story2 = Story.create!(:name => "Chris2", :narrative => "Narrative2", :estimate => 3, :priority => 2)
      story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
      Story.list.should == [story1, story2, story3]
    end
  end

  it "a story should have an iteration assigned to it" do
    iteration = Iteration.create!(:name => "1")
    story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1, :iteration => iteration)
    story1.iteration.name.should == "1"
  end

  describe "validations" do
    it "fails when there is no story name" do
      story = Story.new(:narrative => "Narrative1", :estimate => 3, :priority => 1)
      story.valid?
      story.errors[:name].should_not be_empty
    end
    it "fails when there estimate is greater than 12 and priority is <= 3" do
      story = Story.new(:name => "name", :narrative => "Narrative1", :estimate => 13, :priority => 1)
      story.valid?
      story.errors.should_not be_empty
    end
    it "fails if story name is not unique" do
      story = Story.create!(:name => "name", :narrative => "Narrative1", :estimate => 8, :priority => 1)
      story2 = Story.new(:name => "name", :narrative => "Narrative1", :estimate => 5, :priority => 1)
      story2.valid?
      story2.errors[:name].should_not be_empty
    end

    it "fails if priority is non-positive" do
      story = Story.new(:name => "name", :narrative => "Narrative1", :estimate => 5, :priority => 0)
      story.valid?
      story.errors[:priority].should_not be_empty
    end
    it "fails if estimate is non-positive" do
      story = Story.new(:name => "name", :narrative => "Narrative1", :estimate => -1, :priority => 1)
      story.valid?
      story.errors[:estimate].should_not be_empty
    end
    it "fails if estimate is non-fibonoci" do
      story = Story.new(:name => "name", :narrative => "Narrative1", :estimate => 6, :priority => 1)
      story.valid?
      story.errors[:estimate].should_not be_empty
    end


  end
  describe "association" do
    describe "iteration" do
      xit "can use the iteration_id method" do
        iteration1 = Iteration.create!(:name => "1")
        story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1, :iteration => iteration1)

      end

    end
  end
  it "a story can save an iteration" do
    iteration1 = Factory.create(:iteration, :name => "iteration1")
    #iteration2 = Iteration.create!(:name => "2")
    story1 = Factory.create(:story)
    story1.iteration = iteration1
    story1.save!
    story1 = Story.find(story1.id)

    story1.iteration.should == iteration1

  end

  describe "iteration_name"  do
    it "should return blank string if there is no iteration name" do
      story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
      story1.iteration_name.should == ""
    end

    it "should return the iteration name when it has an iteration assigned" do
      iteration1 = Iteration.create!(:name => "1")
      story1 = Story.create!(:name => "Chris1", :narrative => "Narrative1", :estimate => 3, :priority => 1)
      story1.iteration = iteration1
      story1.save!
      story1 = Story.find(story1.id)
      story1.iteration_name.should == "1"
    end


  end




end

class Story < ActiveRecord::Base

  validates :name, :presence => true
  validates_uniqueness_of(:name)
  validates_numericality_of :priority, :greater_than => 0
  validates_numericality_of :estimate, :greater_than => 0
  validates_inclusion_of :estimate, :in => [1,2,3,5,8]
  validate :high_estimate_stories_are_low_priority
  cattr_reader :per_page
  @@per_page = 3
  belongs_to :iteration

  def self.list(page)
    @stories = Story.paginate({:page => page, :order => "priority ASC"})
  end

  def iteration_name
    if iteration.nil?
      ""
    else
      iteration.name
    end
  end

  def high_estimate_stories_are_low_priority
    if estimate && priority
      if estimate >= 13 and priority <= 3
        errors.add(:base, "Cannot create high estimate stories for high priority stories")
      end
    end
  end
end

Given /^the following stor(?:y|ies):$/ do |stories|
  Story.create!(stories.hashes)
end
Given /^the following stories assigned to (.*):$/ do |arg1, table|
  stories = Story.create!(table.hashes)
  stories.each do |story|
    story.iteration = Iteration.find_by_name(arg1)
    story.save!
  end

end

When /^I delete the (\d+)(?:st|nd|rd|th) stories$/ do |pos|
  visit stories_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following stories:$/ do |expected_stories_table|
  expected_stories_table.diff!(tableish('table tr', 'td,th'))
end

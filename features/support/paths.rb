module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new iteration page/
      new_iteration_path

    when /the new stories page/
      new_stories_path
    when /the edit story page for (.+)/
      edit_story_path(Story.find_by_name($1).id)
    when /the show story page for (.+)/
      story_path(Story.find_by_name($1).id)
    when /the show iteration page for (.+)/
      iteration_path(Iteration.find_by_name($1).id)
    when /login/
      new_user_session_path



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

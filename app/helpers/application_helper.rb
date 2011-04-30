module ApplicationHelper
  def error
    base_title = "Ruby on Rails Tutorial Sample App"
    if !@error.nil?
	  @error
    end
  end
end

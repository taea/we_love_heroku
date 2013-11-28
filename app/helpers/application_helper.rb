module ApplicationHelper
  def add_or_new
    user_signed_in? ? 'add' : 'new'
  end
end

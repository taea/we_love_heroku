module ApplicationHelper
  def add_or_new
    user_signed_in? ? 'add' : 'new'
  end

  def site_thumnail(url)
    image_tag "http://capture.heartrails.com/large/delay=1?#{url}", class: 'img-thumbnail', size: '360x272'
  end
end

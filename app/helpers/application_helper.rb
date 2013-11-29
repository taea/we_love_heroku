module ApplicationHelper
  def fb_connect_js opts = {}
    uri = "//connect.facebook.net/{locale}/all.js"
    case I18n.locale
      when :ja
        uri.sub '{locale}', 'ja_JP'
      else
        uri.sub '{locale}', 'en_US'
    end
  end

  def add_or_new
    user_signed_in? ? 'add' : 'new'
  end

  def site_thumnail(url)
    image_tag "http://capture.heartrails.com/large/delay=1?#{url}", class: 'img-thumbnail', size: '360x272'
  end
end

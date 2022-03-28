module ApplicationHelper
  def is_path?(path)
    request.path =~ /^#{Regexp.quote(path)}/
  end

  def nav_button_class(path)
    if is_path?(path)
      return "active-nav-button"
    else
      return "nav-button"
    end
  end

  def nav_button_class_mobile(path)
    if is_path?(path)
      return "active-mobile-nav-button"
    else
      return "mobile-nav-button"
    end
  end

  def format_number(n)
    if n.to_i.to_f == n
      n.to_i
    else
      n
    end
  end
end

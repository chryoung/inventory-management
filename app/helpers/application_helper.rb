module ApplicationHelper
  def is_path?(path)
    request.path =~ /^#{Regexp.quote(path)}/
  end

  def nav_button_class(path)
    if is_path?(path)
      return "bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
    else
      return "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
    end
  end

  def nav_button_class_mobile(path)
    if is_path?(path)
      return "bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
    else
      return "text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
    end
  end
end

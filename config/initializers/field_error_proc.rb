ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.start_with? '<input'
    html_tag.gsub(/class="[^"]+"/, 'class="form-input-error"').html_safe
  else
    html_tag
  end
end

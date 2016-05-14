module ApplicationHelper
  def nav_bar
    content_tag(:ul, class: "nav navbar-nav") do
      yield
    end
  end

  def nav_link(text, path)
    options = current_page?(path) ? { class: "active"}: {}
    content_tag(:li, options) do
      link_to text, path
    end
  end

  def css_class_for_flash_type(flash_type)
    css_classes_for_flash_type = {
      notice: 'alert-success',
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      info: 'alert-info'
    }
    css_classes_for_flash_type[flash_type.to_sym]
  end
end

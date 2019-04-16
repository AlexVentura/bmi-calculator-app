module ApplicationHelper
  BOOTSTRAP_FLASH_TYPES = {
    success: 'success',
    info: 'info',
    warning: 'warning',
    danger: 'danger',
    notice: 'info',
    alert: 'primary'
  }

  def flash_class(flash_type)
    BOOTSTRAP_FLASH_TYPES.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_icon(flash_type)
    {
      success: 'check-circle',
      info: 'question-circle',
      warning: 'exclamation-triangle',
      danger: 'times-circle',
      notice: 'bell fa-lg',
      alert: 'exclamation-circle'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def errors_for(resource)
    if resource.errors.any?
      content_tag(:div, class: 'card border-danger mb-3') do
        concat(content_tag(:div, class: 'card-header bg-danger text-white') do
          concat "#{pluralize(resource.errors.count, 'error')} prohibited this #{resource.class.name.downcase} from being saved:"
        end)
        concat(content_tag(:div, class: 'card-body') do
          concat(content_tag(:ul, class: 'mb-0') do
            resource.errors.full_messages.each do |message|
              concat content_tag(:li, message)
            end
          end)
        end)
      end
    end
  end
end

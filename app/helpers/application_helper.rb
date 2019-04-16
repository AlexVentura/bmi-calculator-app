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
    # Return the 'color class' name to be used in the flash message
    BOOTSTRAP_FLASH_TYPES.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_icon(flash_type)
    # Return the 'icon' name to be used in the flash message
    {
      success: 'check-circle',
      info: 'question-circle',
      warning: 'exclamation-triangle',
      danger: 'times-circle',
      notice: 'bell fa-lg', # Only for DEVISE flash messages
      alert: 'exclamation-circle'
    }[flash_type.to_sym] || flash_type.to_s
  end
end

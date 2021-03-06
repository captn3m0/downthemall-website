module DialogHelpers

  # If you do something that triggers an alert, do it inside an accept_js_alert block
  def accept_js_alert
    page.evaluate_script 'window.original_alert_function = window.alert;'
    page.evaluate_script 'window.alert = function(msg) { return true; }'
    yield
    page.evaluate_script 'window.alert = window.original_alert_function;'
  end

  # If you do something that triggers a confirm, do it inside an accept_js_confirm or reject_js_confirm block
  def accept_js_confirm
    page.evaluate_script 'window.original_confirm_function = window.confirm;'
    page.evaluate_script 'window.confirm = function(msg) { return true; }'
    yield
    page.evaluate_script 'window.confirm = window.original_confirm_function;'
  end

  # If you do something that triggers a confirm, do it inside an accept_js_confirm or reject_js_confirm block

  def reject_js_confirm
    page.evaluate_script 'window.original_confirm_function = window.confirm;'
    page.evaluate_script 'window.confirm = function(msg) { return false; }'
    yield
    page.evaluate_script 'window.confirm = window.original_confirm_function;'
  end

end

RSpec.configuration.include DialogHelpers, :type => :acceptance




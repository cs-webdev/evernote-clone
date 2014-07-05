Clearance.configure do |config|
  config.mailer_sender = 'reply@evernote-clone.com'
  config.redirect_url = '/notebooks'
end

Clearance::BaseController.class_eval do
  def clearance_controller?
    true
  end
end

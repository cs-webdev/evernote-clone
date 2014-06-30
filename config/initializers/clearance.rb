Clearance.configure do |config|
  config.mailer_sender = 'reply@evernote-clone.com'
end

Clearance::BaseController.class_eval do
  def clearance_controller?
    true
  end
end

class SessionsController < Clearance::SessionsController
  protected
  def url_after_create
    notebooks_path
  end
end

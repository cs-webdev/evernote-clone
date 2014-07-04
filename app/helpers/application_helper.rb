module ApplicationHelper
  def form_errors(object)
    render :partial => 'shared/object_errors', :locals => { :object => object }
  end
end

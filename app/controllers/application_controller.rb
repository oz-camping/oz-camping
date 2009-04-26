# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  include AuthenticatedSystem
  before_filter :get_pages_for_tabs
  
  def get_pages_for_tabs

    if logged_in?
      @tabs=  Page.find_main
    else
      @tabs = Page.find_main_public
    end
  end

  def get_page_metadata
    @page = Page.find_by_name(params[:name])
    @pagetitle = @page.title
  end
end


class PagesController < ApplicationController
  def error_404
    respond_to do |format|
      format.html
      format.any { head(404) }
    end
  end
end

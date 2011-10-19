class PagesController < ApplicationController
  skip_before_filter :admin_required

  def home
  end

  def brands
  end

  def cs
  end

  def info
  end

  def contact
  end
end

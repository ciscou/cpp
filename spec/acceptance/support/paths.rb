module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage(options = {})
    if options.key? :locale
      localized_root_path options
    else
      root_path options
    end
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance

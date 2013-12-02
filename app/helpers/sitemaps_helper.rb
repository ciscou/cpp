module SitemapsHelper
  def object_updated_at_or_now(object)
    object.try(:updated_at) || Time.current
  end
end

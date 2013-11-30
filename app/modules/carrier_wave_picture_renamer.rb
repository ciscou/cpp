module CarrierWavePictureRenamer
  def self.included(base)
    base.before_update :rename_picture, :if => :es_name_changed?, :unless => :picture_changed?, :on => :update
  end

  private

  def rename_picture
    old_picture = read_attribute(:picture)
    new_picture = "#{es_name.parameterize}#{File.extname old_picture}"
    return if old_picture == new_picture

    picture.file.move(new_picture)
    picture.versions.keys.each do |version|
      picture.send(version).file.move("#{version}_#{new_picture}")
    end
    write_attribute(:picture, "#{new_picture}")
  end
end

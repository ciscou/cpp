module CarrierWavePictureRenamer
  def self.included(base)
  base.after_validation :rename_picture, :if => :name_changed?, :unless => :picture_changed?, :on => :update
  end

  private

  def rename_picture
    new_picture = "#{name.parameterize}#{File.extname read_attribute(:picture)}"
    picture.file.move(new_picture)
    picture.versions.keys.each do |version|
      picture.send(version).file.move("#{version}_#{new_picture}")
    end
    write_attribute(:picture, "#{new_picture}")
  end
end

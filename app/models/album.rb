class Album < ApplicationRecord
   def catagory_name
   catagory.try(:name)
  end

  def catagory_name=(name)
    self.catagory = Catagory.find_or_create_by(name: name) if name.present?
  end
end

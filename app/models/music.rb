class Music < ActiveRecord::Base
def self.search(search)
    if search
      where('label LIKE ?', "%#{search}%")
    else
      where('label LIKE ?', "%#{}%")
    end
end
end

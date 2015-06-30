class Contact < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..200 }
  validates :email, presence: true, length: { in: 3..200 }
  validates :description, presence: true, length: { in: 20..3000 }
end

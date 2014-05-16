class Todo < ActiveRecord::Base

  validates :description, presence: true
  validates :user, presence: true

  belongs_to :user
end

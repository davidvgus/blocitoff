class Todo < ActiveRecord::Base

  validates :description, presence: true
  validates :user, presence: true

  belongs_to :user

  def time_left
    #get the epoch created time and subtract epoch from now return days
    days_old = (Time.now - self.created_at).to_i / 86400
    days_old > 7 ? 0 : 7 - days_old
  end
end

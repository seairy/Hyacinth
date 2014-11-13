class Notification < ActiveRecord::Base
  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
  scope :sorted, -> { order(read: :asc, created_at: :desc) }
end

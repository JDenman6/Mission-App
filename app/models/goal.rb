class Goal < ActiveRecord::Base
  validates :body, :user, :status, presence: true
  belongs_to :user
  validate :validate_completed

  after_initialize :default_completed

  def default_completed
    self.completed ||= false
  end

  def validate_completed
    if [true, false].include?(self.completed)
      true
    else
      self.errors.add(:completed, 'must be a boolean')
    end
  end

end

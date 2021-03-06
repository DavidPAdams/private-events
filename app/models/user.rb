class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save :downcase_email

  # validates :name, presence: true, length: { maximum: 50 },
  #                  uniqueness: { case_sensitive: true}
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :invitations, foreign_key: "attendee_id"
  has_many :attended_events, through: :invitations

  def upcoming_events
    self.attended_events.where("date >= ?", Time.zone.now)
  end

  def previous_events
    self.attended_events.where("date < ?", Time.zone.now)
  end

  private

    def downcase_email
      email.downcase!
    end

end

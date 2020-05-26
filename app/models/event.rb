class Event < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  has_many :creates, foreign_key: 'event_id'
  has_many :creators, through: :creates, source: :user
  has_many :invitations
  has_many :users_invited, through: :invitations, source: :invitee

  has_many :attendances, foreign_key: 'event_id'
  has_many :users_attendants, through: :attendances, source: :user

  def invite_list(words)
    return words.split(',')
  end

  def invite_action(arr)
    list = invite_list(arr)
    byebug
    list.each do |user_mail|
      user = User.find_by(email: user_mail)
      Invitation.create(invitor: User.current_user, invitee: user, event: self)
    end
  end

end

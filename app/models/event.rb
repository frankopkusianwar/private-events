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

  has_many :sign_ups, foreign_key: 'Event_id'
  has_many :users_signed_up, through: :sign_ups, source: :User

  def invite_list(words)
    return words.split(',')
  end

  def invite_action(arr, id)
    list = invite_list(arr)
    
    current_user_now = User.find(id)
    list.each do |user_mail|
      user = User.find_by(email: user_mail)
      inv = Invitation.new(invitor: current_user_now, invitee: user, event: self)
      inv.save
    end
  end

  def is_it_past?
    today = Time.now.to_s.split(' ')[0]
    # today = today[5, today.size]
    if date > today
      return 'Coming'
    elsif date == today
      return 'Today'
    else
      return 'Past'
    end
  end

end

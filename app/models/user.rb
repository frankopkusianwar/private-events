class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_invited, class_name: 'Invitation', foreign_key: 'invitor_id'
  has_many :users_invitors, class_name: 'Invitation', foreign_key: 'invitee_id'
  has_many :invitations, through: :users_invited, source: :invitee
  has_many :invites, through: :users_invitors, source: :invitor
  has_many :events, foreign_key: 'creator_id'

  def check_invited?(event)
    event.users_invited.include?(self)
  end

  def check_signed_up?(event)
    return true if event.users_signed_up.include?(self)
  end

  def check_events(invitations)
    arr = []
    invitations.each do |i|
      arr << i.event
    end
    arr
  end
  
  def prev_events(events)
    previus = []
    events.each do |e|
      previus << e if e.date < Time.now
    end
    previus
  end

  def coming_events(events)
    upcoming = []
    events.each do |e|
      upcoming << e if e.date > Time.now
    end
    upcoming
  end
end

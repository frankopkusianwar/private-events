class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creates, foreign_key: 'user_id'
  has_many :events_created, through: :creates, source: :event
  has_many :users_invited, class_name: 'Invitation', foreign_key: 'invitee_id'
  has_many :users_invitors, class_name: 'Invitation', foreign_key: 'invitor_id'
  has_many :invitations, through: :users_invited, source: :invitor
  has_many :invites, through: :users_invitors, source: :invitee
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'user_id'
  has_many :events_attended, through: :attendances, source: :event

  has_many :sign_ups, foreign_key: 'User_id'
  has_many :events_signed_up, through: :sign_ups, source: :Event

  def check_invited?(event)
    return true if event.users_invited.include?(self)
  end

  def check_signed_up?(event)
    return true if event.users_signed_up.include?(self)
  end
end

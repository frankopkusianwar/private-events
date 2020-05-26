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
  

end

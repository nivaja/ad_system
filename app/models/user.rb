class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # rolify :before_add => :before_add_method
  belongs_to :role
  has_many :follows
  has_many :validations
  has_many :followed_user, :class_name => "Follow"
  has_many :shared_ads
  has_many :ads
  has_many :senders, :class_name => "ShareRequest"
  has_many :recievers, :class_name => "ShareRequest"
  has_one :wallet
  # before_save :assign_role



  after_create :assign_default_role

  def assign_default_role
    self.add_role(:normal) if self.roles.blank?
  end
end

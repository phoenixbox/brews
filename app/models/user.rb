class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation

  has_many :games

  validates_confirmation_of :password
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..12},
                       :on => :create
  validates_presence_of :email
  validates_format_of :email, :with => /@/
  validates_uniqueness_of :email

  def title
    "Game Admin"
  end
end

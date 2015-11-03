class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :role_users
  accepts_nested_attributes_for :role_users
  has_many :roles, :through => :role_users
  has_many :posts
  def admin?
  	roles.map{ |r| r.to_s}.include?('admin')
  end

  after_create :create_role_for_user

  def create_role_for_user
    role_users.build(:role_id => 1 ).save
  end
end

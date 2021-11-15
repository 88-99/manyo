class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 1 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true

  before_destroy :check_destroy_admin
  before_update :check_update_admin

  private

  def check_destroy_admin
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
    # throw(:abort) if (self.admin == false && User.where(admin: true).size == 1) && self == User.find_by(admin:true)
  end

  def check_update_admin
    # if User.where(admin: true).count == 1 && self.admin == false
    #   throw(:abort)
    # end
    throw(:abort) if self.admin == true && User.where(admin: true).count == 1
  end
end

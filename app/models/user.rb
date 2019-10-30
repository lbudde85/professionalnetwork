class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum user_type: [ :agent, :brand, :distributor ]
  validates :user_type, presence: true

  belongs_to :country
  has_many :job_posts

  after_create :create_associative_profile

  def agent_profile
    if self.agent?
      ContractorProfile.find_by(user: self)
    else
      nil
    end
  end

  def brand_profile
    if self.brand?
      BrandProfile.find_by(user: self)
    else
      nil
    end
  end

  def distributor_profile
    if self.distributor?
      ContractorProfile.find_by(user: self)
    else
      nil
    end
  end

  private

  def create_associative_profile
    if self.brand?
      BrandProfile.create(user: self)
    elsif self.agent? || self.distributor?
      ContractorProfile.create(user: self)
    end
  end
end

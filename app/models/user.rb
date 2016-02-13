class User < ApplicationRecord
  belongs_to :company, dependent: :destroy
  has_many :forms, foreign_key: 'author_id', dependent: :destroy
  has_many :messages, foreign_key: 'author_id', dependent: :destroy

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  scope :by_company, ->(company_id) { where("company_id = ?", company_id) }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def invitation_status
    if self.invitation_accepted_at
      return "Invitation acceptée le #{self.invitation_accepted_at.strftime('%d/%m/%Y')}"
    else
      return "Invitation pas encore acceptée"
    end
  end
end

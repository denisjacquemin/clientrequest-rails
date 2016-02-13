class Form < ApplicationRecord
  belongs_to :type, class_name: 'FormType'
  belongs_to :author, class_name: 'User'
  belongs_to :company
  has_many :messages, dependent: :destroy

  scope :by_author, ->(author_id) { where("author_id = ?", author_id) }
  scope :by_company, ->(company_id) { where("company_id = ?", company_id) }

  validates :type_id, :uid, :company_id, :author_id, presence: true

  def to_param
    uid
  end

end

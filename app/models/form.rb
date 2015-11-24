class Form < ActiveRecord::Base
  belongs_to :type, class_name: 'FormType'
  belongs_to :author, class_name: 'User'
  belongs_to :company

  scope :by_author, ->(author_id) { where("author_id = ?", author_id) }
  scope :by_company, ->(company_id) { where("company_id = ?", company_id) }

  def to_param
    uid
  end

end

class Message < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :form

  scope :by_form, ->(form_id) { where("form_id = ?", form_id) }
end

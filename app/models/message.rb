class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :form

  scope :by_form, ->(form_id) { where("form_id = ?", form_id) }
end

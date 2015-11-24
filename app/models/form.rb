class Form < ActiveRecord::Base
  belongs_to :type, class_name: 'FormType'
  belongs_to :author, class_name: 'User'
  belongs_to :company
end

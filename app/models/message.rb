class Message < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  #belongs_to :form_uid, class_name: 'Form'
end

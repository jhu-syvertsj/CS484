class Account < ActiveRecord::Base
  belongs_to :user

  validates :gender, :inclusion => { :in => %w(male female N/A),
    :message => "%{value} is not a valid entry for gender" }
  
  validates :age, :numericality => { :only_integer => true }
end

# see http://guides.rubyonrails.org/active_record_validations_callbacks.html

class Account < ActiveRecord::Base
  belongs_to :user

  #validates :gender, :inclusion => { :in => %w(male female N/A),
    #:message => "%{value} is not a valid entry for gender" }

  validates :age, :numericality => { :only_integer => true }
  validate :male_female_NA

  def male_female_NA
    if not (gender == "male" or gender == "female" or gender == "N/A") 
      puts "#{gender} is not a valid entry for gender"
    end
  end
end

# see http://guides.rubyonrails.org/active_record_validations_callbacks.html

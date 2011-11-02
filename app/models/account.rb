class Account < ActiveRecord::Base
  belongs_to :user

  validates :gender, :inclusion => { :in => %w(male female N/A), :message => "%{value} is not a valid gender." }
  validates :age, :numericality => { :greater_than => 0, :only_integer => true }
end

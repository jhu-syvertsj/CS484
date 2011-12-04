class User < ActiveRecord::Base
  has_one  :account
  has_many :todolists
  has_many :todoitems, :through => :todolists, :source => :todoitems
end

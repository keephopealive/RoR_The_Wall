class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :message, 			:presence 	=> true,
			  :length 						=> { :within => 1..250 }
end

class Department < ActiveRecord::Base
	has_many :students
end

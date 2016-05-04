class Student < ActiveRecord::Base
	belongs_to :department
    before_save :name_caps 
    before_create :updatestatus
    after_commit :success_msg
    belongs_to :user

    validates :name, presence: true
    validates :department_id, presence: true

    validate :body_length 







    def body_length
    errors.add(:base, "Your description has exceeded the limit capacity") if desc.length >20
    end
    
    protected
	def name_caps
      self.name = name.capitalize
    end
    def updatestatus
      self.status = "Active"
    end
    def success_msg
    puts "We have saved record."
    end
end

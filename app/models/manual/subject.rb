module Manual
  class Subject
    include Mongoid::Document
    
    embeds_many :laboratories, class_name: "Manual::Laboratory"
    has_many :students, class_name: "University::Student"
    
    field :name, type: String
    field :length, type: Integer, default: 16    
  end
end
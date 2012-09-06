module University
  class University::Student < ::User
    include Mongoid::Document
   
    field :group,    type: String
    field :name,     type: String
    field :surname,  type: String
    field :exercises, type: Hash
    
    embeds_many :tasks, class_name: "University::Task"
    
    
    
  end  
end

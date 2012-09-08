module University
  class University::Student < ::User
    include Mongoid::Document
   
    field :group,    type: String
    field :name,     type: String
    field :surname,  type: String
    field :exercises, type: Hash
    
    field :bachelor, type: Boolean, default: false
    
    belongs_to :subject, class_name: "Manual::Subject"
    
    embeds_many :tasks, class_name: "University::Task" do
      def get_next
        
      end
    end
    
  end  
end

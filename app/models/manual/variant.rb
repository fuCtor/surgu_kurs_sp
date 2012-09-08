module Manual
  class Variant
    include Mongoid::Document
    
    belongs_to :laboratory, class_name: "Manual::Laboratory", inverse_of: :variants
    
    field :text, type: String
    field :complexity, type: Integer, default: 0
    
    def laboratory
      subj = Subject.where("laboratories._id" => self.laboratory_id).first
      begin
        subj.laboratories.select{|i| i.id == self.laboratory_id} .first 
      end if subj
    end    
    
  end
end
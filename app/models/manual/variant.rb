module Manual
  class Variant
    include Mongoid::Document
    
    belongs_to :laboratory, class_name: "Manual::Laboratory", inverse_of: :variants
    
    field :text, type: String
    field :complexity, type: Integer, default: 0
        
    
  end
end
module Manual
  class Laboratory
    include Mongoid::Document
    
    embeds_many :variants, class_name: "Manual::Variant"
    embedded_in :subject, class_name: "Manual::Subject", inverse_of: :laboratories
    
    field :no, type: Integer, default: 0
    field :theme, type: String
    field :goal, type: String
    field :text, type: String
    field :description, type: String
    field :report_content, type: String
    
    def to_param
      self.subject.laboratories.index(self)
    end
  end
end
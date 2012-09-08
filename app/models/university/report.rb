module University
  class DocUploader < CarrierWave::Uploader::Base
    storage :file
  end
  
  class Report
    include Mongoid::Document
    include Mongoid::Versioning
    include Mongoid::Timestamps::Created
    #include Trackable
    
    max_versions 5
    
    belongs_to :task, class_name: "University::Task", inverse_of: :reports
    
    mount_uploader :file, DocUploader, type: String
    field :review, type: String
  end
  
end

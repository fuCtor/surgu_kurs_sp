module University
  class DocUploader < CarrierWave::Uploader::Base
    storage :file
  end
  
  class Report
    include Mongoid::Document
    include Trackable
    
    embedded_in :tasks, class_name: "University::Task"
    
    field :date, type: Date, default: ->{ Time.now }
    
    mount_uploader :file, DocUploader, type: String
    field :review, type: String
  end
  
end


require 'carrierwave/datamapper'

class CmsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
	
  
end

class Ticket

  include DataMapper::Resource

  property :id, Serial
		property :ticket_subject, Text, :required => true

  property :name,  String,   :required => true
  property :date_time,                  DateTime,     :required => true, :default => DateTime.now
  mount_uploader :attachment,           HdeskUploader
  property :email_id,                       String,   :required => true,    :format => :email_address  
  property :messages ,String, :required => true
  property :priority ,String
  property :category ,String, :required => true	
  
  

  #has n, :comments
  
end

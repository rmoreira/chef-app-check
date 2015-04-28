actions [:create, :delete]
default_action :create

attribute :service_name, :name_attribute => true, :kind_of => String
attribute :command,  :kind_of => String, :required => true
attribute :filename, :kind_of => String, :default => "check"
attribute :path,  :kind_of => String, :default => "/etv/service/app-check"
attribute :owner, :kind_of => String, :default => "www-data"
attribute :group, :kind_of => String, :default => "www-data"
attribute :mode,  :kind_of => [Fixnum,String], :default => 0755

attr_accessor :exists
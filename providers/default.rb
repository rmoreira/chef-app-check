

# Support whyrun
def whyrun_supported?
  true
end

action :create do
  if @current_resource.exists
    Chef::Log.info "#{ @new_resource } already exists - nothing to do."
  else
    converge_by("Create #{ @new_resource }") do
      create_check
    end
  end
end

action :delete do
  if @current_resource.exists
    converge_by("Delete #{ @new_resource }") do
      delete_printer_port
    end
  else
    Chef::Log.info "#{ @current_resource } doesn't exist - can't delete."
  end
end

def load_current_resource
  @current_resource = Chef::Resource::AppCheck.new(@new_resource.name)
  @current_resource.service_name(@new_resource.name)
  @current_resource.filename(@new_resource.filename || @new_resource.name)
  @current_resource.path(@new_resource.path)
  @current_resource.owner(@new_resource.owner)
  @current_resource.group(@new_resource.group)
  @current_resource.mode(@new_resource.mode)
  @current_resource.cookbook(@new_resource.cookbook)
end

def create_check

  directory new_resource.path do
    owner     new_resource.owner
    group     new_resource.group
    recursive true
  end

  template ::File.join(new_resource.path, new_resource.filename) do
    cookbook  new_resource.cookbook
    source    'check.erb'
    mode      new_resource.mode
    owner     new_resource.owner
    group     new_resource.group
    variables({'command' => new_resource.command})
  end 
end

def delete_check
  file File.join(new_resource.path, new_resource.filename) do
    action :delete
  end
end

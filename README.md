# app-check

This LWRP adds the ability to create a check scripts for whatever you like
as long as you pass the command as a string
The intention is to be able to hit the check script from outside the server.

## Supported Platforms

Linux?!

## Usage
Add cookbook to your metadata.rb and start using it like so:

```ruby
app_check "test_check" do
  path "/etc/service/test_check"
  command "echo 'hello world'"
end

app_check "test_check2" do
  path "/etc/service/test_check"
  command "echo 'hello world'"
end

app_check "test_check2" do
  path "/etc/service/test_check"
  command "echo 'hello world'"
  action :delete
end
```

## TODO:
Hit the check script from outside the server.

## License and Authors

Author:: Rafael Moreira (<raffvongibbs at gmail dot com>)


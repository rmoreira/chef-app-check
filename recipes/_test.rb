#
# Cookbook Name:: app-check
# Recipe:: _test
#
# Copyright (C) 2014 Rafael Moreira
#
# All rights reserved - Do Not Redistribute
#

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
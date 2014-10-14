#
# Cookbook Name:: docker-docker-registry
# Recipe:: install-s3
#
# Copyright (C) 2014 Daniel Ku
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

registry = Chef::EncryptedDataBagItem.load "secrets", "docker-registry"
bucket = registry['aws']['bucket']
key = registry['aws']['key']
secret = registry['aws']['secret']

docker_container 'registry' do
  image 'registry:latest'
  container_name 'registry'
  detach true
  port '5000:5000'
  env [
    "SETTINGS_FLAVOR=s3",
    "AWS_BUCKET=#{bucket}",
    "STORAGE_PATH=/registry",
    "AWS_KEY=#{key}",
    "AWS_SECRET=#{secret}",
    "SEARCH_BACKEND=sqlalchemy"
  ]
  cmd_timeout 300
  action :run
end

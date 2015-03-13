#!/usr/bin/env ruby
require 'set'
require 'aws-sdk'
require 'term/ansicolor'

Color = Term::ANSIColor

Aws.config[:region] = 'us-east-1'

as_client = Aws::AutoScaling::Client.new
ec2_client = Aws::EC2::Client.new

asgs = as_client.describe_auto_scaling_groups.auto_scaling_groups

in_use_lc_names = asgs.map &:launch_configuration_name

all_lcs = as_client.describe_launch_configurations.launch_configurations

lc_map = {}

all_lc_names =  all_lcs.map do |lc|
  name = lc.launch_configuration_name
  lc_map[name] = {
    name: name,
    ami: lc.image_id,
    created: lc.created_time
  }
  name
end

unused_lc_names = all_lc_names - in_use_lc_names

most_recent_unused_lc_by_app = {}

unused_lc_names.each do |lc_name|
  /^(?<app_name>.+?)[v\d-]*$/ =~ lc_name
  known = most_recent_unused_lc_by_app[app_name]
  lc = lc_map[lc_name]

  if !known || known[:created] < lc[:created]
    most_recent_unused_lc_by_app[app_name] = lc
  end
end

images_to_save = Set.new(most_recent_unused_lc_by_app.values.map {|a| a[:ami]})


unused_lc_names.each do |lc_name|
  lc = lc_map[lc_name]
  print "Deleting LC #{Color.bold(lc_name)}: "
  as_client.delete_launch_configuration(launch_configuration_name: lc_name)
  if images_to_save.include? lc[:ami]
    puts "Keeping AMI - #{Color.green(lc[:ami])}"
  else
    puts "Deleting AMI - #{Color.red(lc[:ami])}"
    ec2_client.deregister_image(image_id: lc[:ami])
  end
end

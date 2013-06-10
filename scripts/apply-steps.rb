#!/usr/bin/env ruby

if ARGV.size < 1
  puts "apply_steps.rb usage: apply_steps.rb <cql_path> <cassandra_rpc_host> [steps-dir]"
  exit -1
end

def load_applied_steps
  return [] if !File.exists? STEPS_FILE
  open(STEPS_FILE, "r+").read.split.map { |line| line.split.first }
end

def should_apply?(step)
  !@applied_steps.include? name_of step
end

def log_transation(step)
  open(STEPS_FILE, "a+") { |file| file.puts "#{name_of step} #{Time.now}" }
end

def name_of(step)
  File.basename(step)
end

def apply(step)
  puts "About to apply: #{name_of step}."
  run_step_command(step)
  raise "Failed to apply #{name_of step}." if $?.exitstatus != 0

  log_transation(step)
end

def run_step_command(step)
    cmd = "#{@cql_path} #{@cassandra_rpc_host} #{@cassandra_port} --cql3 --file #{step}" #> /tmp/cassandra-schema-logs-#{name_of step}.log"
    puts cmd
    `#{cmd}`

end

def steps_dir_name
  if ARGV.size < 3
    "steps"
  else
    ARGV[2]
  end
end

STEPS_FILE = "/var/casper/core/cassandra.steps.transactions"

@cql_path = ARGV[0]
@cassandra_rpc_host = ARGV[1]
@cassandra_port = 9160

@steps_dir = steps_dir_name
@current_dir = File.expand_path(File.dirname(__FILE__))
@applied_steps = load_applied_steps

steps_dir = File.join(@current_dir, @steps_dir)
steps = Dir.glob(File.join(steps_dir, "*.cql")).sort

steps.select{ |step| should_apply? step }.each { |step| apply step }

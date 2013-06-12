set :service_name, 'cassandra'
set :user, 'track'

set(:service_features, {
  :start_stop => false
})

# ----------------------------
# Here we add some connectors.

# Connect the task to update cassandra DB 
after 'casper:deploy:deploy_artifact', 'cassandra:update_cass'

namespace :cassandra do
  task :update_cass, :roles => :cassandra do
    # Skip for certain setups
    if find_servers_for_task(current_task).empty?
	    logger.info "No servers set for the role cassandra. Skipping."
	    next    
	  end 
	
	  match_servers :once => true do
    	_cassandra_cqlsh_host = fetch(:cassandra_cqlsh_host, 'localhost')
      logger.info "Using #{_cassandra_cqlsh_host} to run the cqlsh scripts"
    
      # Path to run the apply-schema script, that relies on python 2.6
      # FIXME: We do not need the python_path when in centos 6.3
      python_path = "/usr/local/python/cassandra/python2.6/bin"
      cassandra_path ="/usr/share/apache-cassandra-1.1.6/bin"
      
      run "cd #{release_path} && " +
          "PATH=#{cassandra_path}:#{python_path}:$PATH " +
          "ruby scripts/apply-steps.rb #{cassandra_path}/cqlsh #{_cassandra_cqlsh_host}"
    end
  
  end 
end


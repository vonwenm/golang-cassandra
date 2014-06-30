set :service_name, 'cassandra'
set :user, 'casper'

set(:service_features, { :start_stop => false })

after 'casper:deploy:deploy_artifact', 'cassandra:bootstrap_cass'

# THIS IS A HACK, TO GET CASSANDRA UP AND RUNNING ON THE CI AGENTS.
#
# I ONLY ADDED THIS FILE TO BREAK THE DEPENDENCY TO THE CASSANDRA REPO.
#
# A BETTER WAY TO DO THIS WOULD BE TO CHEF THE CI AGENTS WITH CASSANDRA OR
# RUN CASSANDRA INSIDE A DOCKER CONTAINER ON LOCAL -> CI -> ENVS.
#
# -- pat (30/06/2014)
namespace :cassandra do
  task :bootstrap_cass, :roles => :cassandra do
    run "cd #{release_path} && sh ci/bootstrap-cassandra.sh"
  end
end


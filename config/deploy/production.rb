set :stage, :production
server '162.243.171.44', user: 'deploy', roles: %w{web app db}

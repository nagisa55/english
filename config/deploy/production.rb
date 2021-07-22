server '18.178.69.115', user: 'nagisa', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/enprove_key_rsa'

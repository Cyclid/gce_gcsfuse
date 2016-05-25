# Create a Runit service definition for the gcsfuse process
default['gce_gcsfuse']['service'] = 'runit'

# Default user (not a very useful user, though!)
default['gce_gcsfuse']['user'] = 'nobody'
default['gce_gcsfuse']['group'] = 'nogroup'

# The location to mount the FUSE filesystem
default['gce_gcsfuse']['mountdir'] = '/gcsfuse'

# The one thing we can't know: this cookbook is designed to be wrapped.
default['gce_gcsfuse']['bucket'] = 'my-bucket'

# Enable the allow_other FUSE option?
default['gce_gcsfuse']['allow_other'] = false

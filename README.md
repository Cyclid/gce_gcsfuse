# gce\_gcsfuse

Installs and configures the Google GCS FUSE daemon for use with Google Compute Engine (GCE) instances that require block-filesystem style access to a Google Compute Storage bucket.

See https://github.com/GoogleCloudPlatform/gcsfuse for more information on gcsfuse.

## Dependencies

This cookbook requires `runit` for the Runit service configuration. It only supports Runit as a service provider at the moment.

## Attributes

* `default['gce_gcsfuse']['service']` Service provider to use to run `cloud_sql_proxy`. Defaults to `runit`
* `default['gce_gcsfuse']['user']`  User to run the `gcsfuse` daemon as. All files on the FUSE filesystem will be presented as owned by this user. See https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/semantics.md#permissions-and-ownership for more information. Defaults to `nobody`
* `default['gce_gcsfuse']['group']` Group to run the `gcsfuse` daemon as. See above. Defaults to `nogroup`
* `default['gce_gcsfuse']['mountdir']` Directory to mount the FUSE filesystem on. Defaults to `/gcsfuse`
* `default['gce_gcsfuse']['bucket']` GCS bucket to mount. This must be a bucket that your instance can access. Defaults to `my-bucket`

## Recipes

### default

Runs both gce\_gcsfuse::install and gce\_gcsfuse::service

### install

Installs the `gcsfuse` package and ensures that the mountpoint is created and configured correctly.

### service

Creates and configures a service to run `gcsfuse` with the correct parameters.

Currently only Runit is supported as a service provider.

## Prerequisites

In order for `gcsfuse` to work correctly you must have enabled the Cloud Storage API for your project, and the instance must have the Cloud Storage scope defined.

## License and Authors

Authors: Kristian Van Der Vliet vanders@liqwyd.com

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

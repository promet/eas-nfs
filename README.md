# eas-nfs-cookbook

This cookbook manages NFS exports between instances.

## Supported Platforms

Ubuntu 14.04 (may work on other versions of Ubuntu, but target release is 14.04).

## Requirements

* The NFS server host machine must already exist.

## Attributes

Node attributes are required to pass to the applicable nodes.

````json
"aws_nfs": {
  "nfs": {
    "mytestnfs": {
      "networks": "172.31.0.0/16",
      "permissions": "write",
      "path": "/exports/nginxtest"
      "sync": true
      "options": ["no_root_squash"]
    }
  }
}
````

## Usage

Provide node attributes to the nfs recipe and attach to the applicable node.

nfs-server:
This recipe should run on any NFS server exporting mounts.

### eas-nfs::nfs-server

Include `eas-nfs::nfs-server` in your mgmt node's `run_list`:

```json
{
  "run_list": [
    "recipe[eas-nfs::nfs-server]"
  ]
}
```

## License and Authors

Author:: gregpalmier (<greg@prometsource.com>)

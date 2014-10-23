# eas-nfs-cookbook

This cookbook manages NFS exports between instances.

## Supported Platforms

Ubuntu 14.04 (may work on other versions of Ubuntu, but target release is 14.04).

## Requirements

* The NFS server host machine must already exist.
* The NFS client machine must already exist.

## Attributes

Node attributes are required to pass to the applicable nodes.

Servers:

````json
"aws_nfs": {
  "nfs-export": {
    "mytestnfs": {
      "networks": "172.31.0.0/16",
      "writeable": true,
      "path": "/exports/test",
      "sync": true,
      "options": [
      "no_root_squash"
      ]
    }
  }
}
````

Clients:
````json
"aws_nfs": {
  "nfs-mount": {
    "mytestnfs": {
      "server": "172.31.45.120",
      "path": "/mnt/test",
      "fs_type": "nfs",
      "options": "rw",
      "export": "/exports/test",
      "action": "[:mount, :enable]"
    }
  }
}
````

## Usage

Provide node attributes to the nfs recipe and attach to the applicable node.

nfs-server:
This recipe should run on any NFS server exporting mounts.

nfs-mount:
This recipe should run on any client machine mounting exports.

### eas-nfs::nfs-server

Include `eas-nfs::nfs-server` in your NFS Server Node `run_list`:

```json
{
  "run_list": [
    "recipe[eas-nfs::nfs-server]"
  ]
}
```

### eas-nfs::nfs-mount

Include `eas-nfs::nfs-mount` in your NFS Client Node `run_list`:

```json
{
  "run_list": [
    "recipe[eas-nfs::nfs-mount]"
  ]
}
```

## License and Authors

Author:: gregpalmier (<greg@prometsource.com>)

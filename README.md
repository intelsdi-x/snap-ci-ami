DISCONTINUATION OF PROJECT. 

This project will no longer be maintained by Intel.

This project has been identified as having known security escapes.

Intel has ceased development and contributions including, but not limited to, maintenance, bug fixes, new releases, or updates, to this project.  

Intel no longer accepts patches to this project.
# Snap CI AMI

This repo contains the packer specification for building an AMI for testing Snap plugins.

## Usage

Specify [AWS credential](https://www.packer.io/docs/builders/amazon.html#specifying-amazon-credentials), and build the AMI:
```
$ AWS_ACCESS_KEY=... \
  AWS_SECRET_KEY=... \
  packer build serverspec.json
```

For verbose output, prefix the environment variable: `PACKER_LOG=1`

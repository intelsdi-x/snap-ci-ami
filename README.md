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

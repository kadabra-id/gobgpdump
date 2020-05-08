.PHONY: build upload-binaries

OUTDIR := deploy/_output
VERSION ?= 0.0.1
S3_ENDPOINT := s3://route-collector/releases
S3_URL := https://

export GO111MODULE        ?= on

build:
	CGO_ENABLED=0 go build -o ${OUTDIR}/gobgpdump/gobgpdump cmd/gobgpdump/gobgpdump.go

upload-binaries:
	@s3cmd put ${OUTDIR}/gobgpdump/gobgpdump ${S3_ENDPOINT}/${VERSION}/linux/amd64/gobgpdump
	@s3cmd setacl --acl-public ${S3_ENDPOINT}/${VERSION}/linux/amd64/gobgpdump

#!/bin/sh

env CGO_ENABLED=1 GO111MODULE=on go install github.com/doronbehar/pistol/cmd/pistol@latest

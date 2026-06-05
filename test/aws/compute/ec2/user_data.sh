#!/bin/bash
set -e
apt update -y
apt install ec2-instance-connect docker.io -y
systemctl enable docker --now
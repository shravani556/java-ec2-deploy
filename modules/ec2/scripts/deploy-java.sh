#!/bin/bash
yum update -y
yum install -y java-1.8.0-openjdk

echo "Deploying Java app..." > /home/ec2-user/deploy.log
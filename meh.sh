#!/bin/bash
lib=$(pip install boto3 aws-shell httpie awscli chalice requests autopep8)
workon p25
echo $lib

#!/usr/bin/env bash

# Verify an email address so it can recieve email from our sandbox SES

EMAILADDR=${1}

aws ses verify-email-identity --email-address ${EMAILADDR}

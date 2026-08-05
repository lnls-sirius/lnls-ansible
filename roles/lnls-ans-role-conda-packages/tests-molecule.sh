#!/bin/bash
set -exu

export DNS_SERVER1=10.0.0.71
export DNS_SERVER2=10.0.0.72
molecule --verbose test

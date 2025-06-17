#!/bin/bash

# Defult JMeter test plan
TEST_PLAN=${1:-"Testplans/jpet.jmx"}

#Run JMeter test
echo "Running JMeter test: ${TEST_PLAN}" jmeter -n -t "${TEST_PLAN}" -l results.jtl

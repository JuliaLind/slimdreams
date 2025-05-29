#!/bin/bash

cd auth-server
npm run test:unit
npm run test:scen

cd ../data-server
npm run test:unit
npm run test:scen

cd ../web-server
npm run test:unit
npm run test:e2e # Runs e2e tests of built version without the interative Cypress GUI

# npm run test:e2e:dev # Uncomment this line to run the tests in interactive mode using Cypress GUI

cd ..
# SlimDreams

SlimDreams is a school project from the end of year 1 of Webprogrammerare program at Linneus University https://coursepress.lnu.se/kurser/mjukvaruutvecklingsprojekt/.  


The system consists of:  
  
Frontend single-page application in Vue: https://github.com/JuliaLind/1dv613-web-server  
Auth-server in Express: https://github.com/JuliaLind/1dv613-auth-server  
Data-server in Express: https://github.com/JuliaLind/1dv613-data-server  

![High-level diagram of the system](./.readme/system.drawio.png)  

SlimDreams is a mobile-first Progressive Web Application, that is intended to be used as an aid in a healthy weight-loss process for people over 18.  

The application comes with ready to use food-item data for 6482 food items, which have been "scraped" from willys.se. The data is available under data-server/data/foods.json.  

## Clone down the repo
```git clone --recurse-submodules https://github.com/JuliaLind/slimdreams```

## Start up the system locally in docker

1. Clone all three repos to this directory . If you have already cloned the repository before, run ```bash upd.bash``` from the root directory to pull the latest updates from the submodules/repos.   
2. Make sure to create neccessary .env files (example files are available in the root of each project)  
3. Create a public and private key pair with:  
```openssl genrsa -out private.pem 2048```
```openssl rsa -in private.pem -pubout -out public.pem```


and place them as follows:  
- private.pem should be placed in the root of the auth-server  
- public.pem should be placed in the root of the data-server  

Don't mix the order, as the private key can be used to generate new public keys!  

Additionally create another public/private key pair and place both in the route of the auth-server as test_private.pem and test_public.pem - these will be used in scenario testing.  
4. Start up the system in docker by standing in this directory and running ```bash start.bash```.
5. In your browser you will find the web-application on http://localhost:4173/, the auth-server on http://localhost:5053/api/v1/ (endpoint descriptions are available in the README of the auth-server repo) and data-server on http://localhost:5054/api/v1/ (endpoint descriptions are available on http://localhost:5054/api/v1/docs/).  
6. Unfortunately testing from within containers is not working, but you can run all tests locally. Keep the dockerized application running for scenario tests and e2e tests:  
- Start by runnin ```npm install``` in each repo  
- Run unit tests with ```npm run test:unit```. (Command available in all three repos)  
- From the auth-server and data-server direcotries you can run scenario tests with ```npm run test:scen```.  
- From the web-server directory you can run e2e tests with ```npm run test:e2e:dev``` - this will open the Cypress GUI where you can choose which browser to run the tests in.  
7. Close down the containers by running ```bash stop.bash``` from this directory.  
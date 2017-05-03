# Setup React website

This project is set up as a guide for building a React application.
A version is available for Angular and Static websites also. 

This setup uses
 - Webpack
 - Node
 - npm
 

The project is set up in such a way, you can easily start a server, get automatic page updates when changing *.js, *.scss... files, create a production build.
Follow the steps below to get up and running.

### Installation

This site requires [Node.js](https://nodejs.org/) v4+ to run.


Install node plugins
```sh
$ npm install
```

### Running the website

When you open up the "package.json" file, you'll see there's a key called "scripts". Here you'll find the commands you can run using node. 

"scripts": {
    "start": "node server.js"
},
  

Run/start the server
```sh
$ npm start 
```

the "start" command, comes from the "package.json", mentioned in the comments just above.
Basically, this means "node start", runs "node server.js". 

### Make a build
```sh
$ npm build 
```

The build tool will make an optimised "bundle.js" file.
Use these files on the production server.
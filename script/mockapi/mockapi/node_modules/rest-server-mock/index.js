#! /usr/bin/env node

var Promise = require('bluebird')
    , express = require('express')
    , fs = require('fs')

    , routesSetup = require('./lib/routes_setup')
    , FILE_ENCODING = require('./constants/contstants').FILE_ENCODING

if (require.main === module) startAsCmd()

else module.exports = start

function start(serverConfFile) {

    return new Promise(function (resolve, reject) {

        if (!serverConfFile) return resolve()

        fs.readFile(serverConfFile, FILE_ENCODING, read)

        function read(err, data) {

            if (err) return reject(err)

            var serverConf = JSON.parse(data)
                , routes = serverConf.routes
                , port = serverConf.port
                , listener = express()
                , server = undefined

            routesSetup(listener, routes)

            server = listener.listen(port)

            return resolve(server)

        }

    })

}

function startAsCmd() {

    if (process.argv.length !== 3) console.log('usage: node rest-server-mock path_to_config_file')

    else start(process.argv[2])
        .then(function (server) {
                console.log('RestServerMock is listening on port: ', server.address().port, ' ...')
                console.log('Configuration file: ', process.argv[2])
            }
            , function (err) {
                console.log(err)
            })

}


# RestServerMock

  A Simple REST HTTP server that serves the configured JSON responses
  [rest-server-mock](https://github.com/pmatzavin/restServerMock.git)

  Currently it servers JSON responses with status code 200.
  Future versions will support more options including : status codes, headers, encodings, etc.

## About

  The motivation for implementing this module was to provide a quick and simple server to be used
  when developing a rest client.
  In that cases where the rest server has not been implemented yet,
  I wanted to have an HTTP server responding with some mock JSON responses,
  without relying on a more complex mocking framework.

## Installation

```
npm install rest-server-mock
```

## Configuration

  The server's port and routes are configured in a JSON file:

  Example file:
  ```
  {

    "port": 3001

    , "routes": [

      {
        "path": "/a"
        , "type": "GET"
        , "response": {
          "field_1": "f1 get a ok"
          , "field_2": "f2 get a ok"
        }
      }

      , {
        "path": "/a"
        , "type": "POST"
        , "response": {
          "field_1": "f1 post a ok"
          , "field_2": "f2 post a ok"
        }
      }

      , {
        "path": "/a"
        , "type": "PUT"
        , "response": {
          "field_1": "f1 put a ok"
          , "field_2": "f2 put a ok"
        }
      }

      , {
        "path": "/a"
        , "type": "DELETE"
        , "response": {
          "field_1": "f1 delete a ok"
          , "field_2": "f2 delete a ok"
        }
      }

    ]

  }
  ```
## Usage

### As a commandline tool

```
rest-server-mock path_to_configuration_file
```

### As a module

```
// Include the module.
var restServerMock = require('rest-server-mock')
// Start the server. Returns a promise.
restServerMock('path_to_configuration_file/filename.json')
.then(function (server) {
    console.log('RestServerMock is listening on port: ', server.address().port, ' ...')
    console.log('Configuration file: ', process.argv[2])
}
, function (err) {
    console.log(err)
})
// Note that the restServerMock method returns a promise.
```

## Running the tests

```
npm test
```

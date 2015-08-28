var mockServer = require("back-mock");
var path = require("path");

mockServer('0.0.0.0', 2000, path.resolve('./mocks'));

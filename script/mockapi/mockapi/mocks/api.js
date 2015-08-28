exports.api_test = {
  path: '/api/test',
  POST: function() {
    return {
      xxoo: "this is post"
    };
  },
  GET: function() {
    return {
      xxoo: "this is get"
    }
  }
};

exports.api_comptest = {
  path: '/api/love',
  GET: function(req){
    if (req.query.name == "girl"){
      return "yes"
    }
    else {
      return "no"
    }
  }
}

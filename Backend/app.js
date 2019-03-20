var request = require('request');


var admin = require("firebase-admin");

var serviceAccount = require("./myfoodfindr-firebase-adminsdk-62143-5a3b88ae25");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://myfoodfindr.firebaseio.com"
});

var app_id = "449267b6"
var app_key = "dc3d3484b6a0dad040d224e307b60447"

var options = {
    url: "https://api.edamam.com/search?app_id="+app_id+"&app_key="+app_key+"&from=0&to=10&calories=591-722&q="
};

var copy = function(obj) {
	var c = new Object()
	for (key in obj) {
		if (obj[key].constructor === Object) {
			c[key] = copy(obj[key])
		} else {
			c[key] = obj[key]
		}
	}
	return c
}

var setup_example_data = function (firebase, options) {
	var params = [
		"&diet=balanced",
    	"&diet=high-protein",
    	"&diet=low-fat",
    	"&diet=low-carb",
    	"&health=vegan",
    	"&health=vegetarian",
    	"&health=sugar-conscience",
    	"&health=peanut-free",
    	"&health=tree-nut-free",
    	"&health=alcohol-free"
    ]

	var recipes = firebase.firestore().collection('recipes')
	options.url += params[0]
	function callback(error, response, body) {
	    if (!error && response.statusCode == 200) {
	    	body = JSON.parse(body)
	    	console.log(body)
	        recipes.doc(params[0]).set(body)
	    }
	}
	request(options, callback)

}

var config = {
    apiKey: "apiKey",
    authDomain: "projectId.firebaseapp.com",
    databaseURL: "https://databaseName.firebaseio.com",
    storageBucket: "bucket.appspot.com"
  };
 
// request(options, callback)
setup_example_data(admin, options)
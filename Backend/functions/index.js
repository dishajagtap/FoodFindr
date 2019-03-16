const https = require('https')
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase)

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
// exports.addMessage = functions.https.onRequest((req, res) => {
//   // Grab the text parameter.
//   const original = req.query.text;
//   // Push the new message into the Realtime Database using the Firebase Admin SDK.
//   return admin.database().ref('/messages').push({original: original}).then((snapshot) => {
//     // Redirect with 303 SEE OTHER to the URL of the pushed object in the Firebase console.
//     return res.redirect(303, snapshot.ref.toString());
//   });
// });

var getRequest = (link_query) => {
	https.get(link_query, (resp) => {
		let data = '';

		// A chunk of data has been recieved.
		resp.on('data', (chunk) => {
			data += chunk;
		});

		// The whole response has been received. Print out the result.
		resp.on('end', () => {
			return data
		});
	})
}

var example_link = "https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd&from=0&to=3&calories=591-722&health=alcohol-free&q=chicken"
console.log(getRequest(example_link))

exports.exampleRecipeCall = functions.https.onRequest((req, res) => {
	let api_header = "https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd"
	let high_protein = "&health=" + req.query.health
	let calories = "&calories=" + req.query.calories

	var full_link = api_header + high_protein + calories
	var example_link = "https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd&from=0&to=3&calories=591-722&health=alcohol-free&q=chicken"

	return getRequest(example_link)
})

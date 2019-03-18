# FoodFindr
CS 125 Project

# Notes
```
Yohana Notes:
- login segues to prompt user to enter information
- added more scenes and labeled scenes for better clarity
- removed unnecessary files

- added the use of Cocoapods, Firebase
	- please look up instructions on installing Cocoapods so project can be seen
	- Podfile is already made, do pod install
- entry point starts at login
- use FoodFindr.xcworkspace to make edits, since Cocoapods is now being used

Scenes Updated:
Login
	connected to google account
	able to extract(lines 63-68 AppDelegate.swift)
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email

To do:
- Build relationships between scenes
- Extract Healthkit information and add to database
- Get user goals and add to database, scene need to be created
- Output progress based on Healthkit information
- Connect to the recipes API
- Suggestions on recipes based on information
- Apple Watch application may need to be eliminated due to deadline limitations

```

```
User:
	Login/Password
	User Response
		Current Weight
		Height
		Desired Weight
		Current Activity Level (workouts per week)
		Post request:
			server/addUser
			{
				"username": <username (string)>,
				"data": <userdata (object)>
			}
	Activity History
	Recipe History
	Favorite Recipes
	Filter Preferences
		Weight goal
		Dietary Restrictions
			Vegetarian
			Vegan
			Allergies
		Dietary Preferences
		Calorie limit
```
Recipe API
curl "https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd&from=0&to=3&calories=591-722&health=alcohol-free&q=chicken"

App ID: ff7726ea
App key: f563fb2c7043c921bd01d0eeb0312ebd

API Header Link:
https://api.edamam.com/search?app_id=ff7726ea&app_key=f563fb2c7043c921bd01d0eeb0312ebd
https://developer.edamam.com/edamam-docs-recipe-api


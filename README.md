# FoodFindr
CS 125 Project

# Notes
```
Yohana Notes:
- added the use of Cocoapods, Firebase
	- please look up instructions on installing Cocoapods so project can be seen
	- Podfile is already made, do pod install
- entry point starts at login
- use FoodFindr.xcworkspace to make edits, since Cocoapods is now being used

Scenes Updated:
Homepage (proposal of UI, awaiting confirmation)
	the words on the scene are just place markers and should be replaced with the values
	the meal plan suggestion should output breakfast, lunch, dinner, and snack recipes for the day

Login
	connected to google account
	able to extract(lines 63-68 AppDelegate.swift)
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
	
Create Account --REMOVED 
Enter User Data --maybe removed, using Healthkit insteadd
Enter Diet Preferences (UI connected to swift code)

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

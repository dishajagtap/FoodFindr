// User data making and changing

'use strict';



const MAX = 800;

function getRandomInt() {
  return Math.floor(Math.random() * Math.floor(MAX));
}

var users;

var startUserDb = function() {users = {}}

var addUser = function(username, data) {
	users[username] = data;
	return username;
}

var getUser = function(username) {
	return users[username];
}

module.exports = {
	startUserDb: startUserDb,
	addUser: addUser,
	getUser: getUser
}
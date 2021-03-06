/**
 * Copyright 2017, Google, Inc.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';

// // [START app]
// const express = require('express');
// const app = express();
// const bodyParser = require('body-parser');
// app.use(bodyParser.json());

// var users = require('./users');
// users.startUserDb();

app.get('/', (req, res) => {
  res.status(200).send('Welcome to FoodFindr Backend!\n').end();
});

app.get('/user', (req, res) => {
  console.log(req.query);
  res.status(200).send(users.getUser(req.query.username)).end();
});

app.post('/user', (req, res) => {
  res.status(200).end();
  let uname = users.addUser(req.body.username, req.body.data);
  console.log("New User Added!");
  console.log(uname, users.getUser(uname));
});


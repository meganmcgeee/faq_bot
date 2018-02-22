'use strict';

var _stringify = require('babel-runtime/core-js/json/stringify');

var _stringify2 = _interopRequireDefault(_stringify);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var functions = require('firebase-functions');

var admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.dialogflowFirebaseFulfillment = functions.https.onRequest(function (req, res) {

  console.log('Request headers: ' + (0, _stringify2.default)(req.headers));
  console.log('Request body: ' + (0, _stringify2.default)(req.body));
  // An action is a string used to identify what needs to be done in fulfillment
  var action = req.body.result.action;
  // Parameters are any entites that Dialogflow has extracted from the request.
  var parameters = req.body.result.parameters;

  // Contexts are objects used to track and store conversation state
  var inputContexts = req.body.result.contexts;

  // Get the request source slack/facebook/et
  var requestSource = req.body.originalRequest ? req.body.originalRequest.source : undefined;

  // Firestore database
  var db = admin.firestore();

  var actionHandlers = {

    'phone.update': function phoneUpdate() {
      var userRef = db.collection('pd_users').doc('S8c01vAkFWU3I3RlVVNv');
      var address = parameters['address'];

      // Make update in firestore
      userRef.update({ address: address }).then(function () {
        /// successful update - send response to dialogflow
        var data = formatResponse('No problem. Address is updated in Firestore!');
        res.json(data);
      });
    },
    'default': function _default() {
      var data = formatResponse('Hi. I am the default response from the Cloud Function');
    }

    // missing action will call default function. 
  };if (!actionHandlers[action]) {
    action = 'default';
  }

  // Call the handler with action type
  actionHandlers[action]();
});

/// Helper to format the response JSON object
function formatResponse(text) {
  return {
    speech: text,
    displayText: text,
    data: {},
    contextOut: [],
    source: '',
    followupEvent: {}
  };
}

// Mongo DB Configuration 
// require('dotenv').config()

// import { MongoClient } from 'mongodb'

// const connectMongoDB = () => MongoClient.connect(process.env.MONGODB)

// const getDepartmentInfo = (req, res) => {
//   return connectMongoDB()
//     .then(
//     faq_bot => faq_bot.departmentInfo('name')
//         .find({})
//         .toArray()
//         .then(documents => ({ faq_bot, documents }))
//     )
//     .then(({ faq_bot, departmentInfo }) => {
//       db.close()
//       return documents
//     })
//     .then(contacts => res.json(name))
//     .catch(err => res.status(400).send(err.toString()))
// }

// export const handler = getDepartmentInfo
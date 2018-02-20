/**
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
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

const functions = require('firebase-functions');
const { WebhookClient } = require('dialogflow-fulfillment');
const { Text, Payload } = require('dialogflow-fulfillment');

process.env.DEBUG = 'dialogflow:debug';

// Dialogflow action names
const WELCOME_ACTION = 'input.welcome';
const ALERTS = 'input.alerts';
const APP_DOWNLOAD = 'input.appDownload';
const CONTACT_INFO = 'input.contactInfo';
const CONTRACT_POLICE = 'input.contractPolice';
const DIRECTIONS = 'input.directions';
const FINGERPRINT = 'input.fingerPrint';
const HELICOPTER_INFO = 'input.helicopterAlerts';
const JOBS = 'input.jobApplication';
const PARKING_CITATION = 'input.parkingCitation';
const BIKE_PERMIT = 'input.permit';
const GUN_PERMIT = 'input.permit';
const FALLBACK_ACTION = 'input.unknown';

// Wikipedia link and image URLs
let policeStation = 'Sacramento Police Department';
let address = '123 Cherry Tree Ln, Sacramento, CA';
let alerts = 'www.alerts.com/sacp';
let bikePermit = 'https://rideon.sacpd.org/index.aspx?ReturnUrl=%2f';
let phone = '555-555-5555';
let towedLink = 'www.towed.com';
let twitter = 'www.twitter.com/sacramentopd';
let facebook = 'www.facebook.com/sacpd';
let volunteer = 'www.volunteer.com/sacpd';
let jobs = 'www.jobs.com/sacp';
let foundation = 'www.foundation.com/sacp';
let parkingCitations = 'www.parking.com/sacp';
let submitTip = 'www.submittiphere.com';

exports.dialogflowFulfillmentAdvancedSample = functions.https.onRequest((request, response) => {
  const agent = new WebhookClient({ request, response });
  console.log('Dialogflow Request headers: ' + JSON.stringify(request.headers));
  console.log('Dialogflow Request body: ' + JSON.stringify(request.body));

  function welcome(agent) {
    agent.add(`Hi! I'm the police assistant bot. I can help you find information about filing crime reports, applying for jobs and much more. If this is an emergency, please dial 9-1-1.`);
    agent.add(`Please type “Help” for a list of things I can help with.`);
  }

// Address
  function address(agent) {
    agent.add(`${policeStation}'s address is ${address}`);
    agent.add(`If you would like more help, type "Help".`);
  }
// Phone Number
  function contactInfo(agent) {
    agent.add(`${policeStation}'s phone number is ${phone}`);
    agent.add(`If you would like more help, type "Help".`);
  }
  // Links
  // Towing link
  function towedLink(agent) {
    agent.add(`${towedLink}'s phone number is ${towedLink}`);
    agent.add(`If you would like more help, type "Help".`);
  }
// Bike Permit
  function bikePermit(agent) {
    agent.add(`${bikePermit}'s phone number is ${towedLink}`);
    agent.add(`If you would like more help, type "Help".`);
  }
// Social media
  function socialMedia(agent) {
    agent.add(`${policeStation}'s twitter is ${twitter}`);
    agent.add(`${policeStation}'s Facebook page is ${facebook}`);
    agent.add(`If you would like more help, type "Help".`);
  }
// Jobs
  function jobs(agent) {
    agent.add(`${policeStation}'s job listing page is ${jobs}`);
    agent.add(`If you would like more help, type "Help".`);
  }
// Alerts
  function alerts(agent) {
    agent.add(`${policeStation}'s alerts can be found at ${alerts}`);
    agent.add(`If you would like more help, type "Help".`);
  }
  function fallback(agent) {
    agent.add(`I didn't get that, can you try again?`);
    agent.add(`If you would like more help, type "Help".`);
  }

  let actionMap = new Map();
  actionMap.set(WELCOME_ACTION, welcome);
  actionMap.set(DIRECTIONS, address);
  actionMap.set(CONTACT_INFO, contactInfo);
  actionMap.set(BIKE_PERMIT, bikePermit);
  actionMap.set(ALERTS, alerts);
  actionMap.set(JOBS, jobs);
  actionMap.set(FALLBACK_ACTION, fallback);
  agent.handleRequest(actionMap);
});
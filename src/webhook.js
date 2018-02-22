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
'use strict';

process.env.DEBUG = 'actions-on-google:*';

const Assistant = require('actions-on-google').ApiAiAssistant;
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { sprintf } = require('sprintf-js');

admin.initializeApp(functions.config().firebase);

// Pulls from Firebase Realtime Data
// const precinct = admin.database().ref('/precint-info');
// const graph = precint.child('graph');

// Dialogflow Intent names
const ALERT_INTENT = 'alerts';
const APP_INTENT = 'appDownload';
const CONTRACTPD_INTENT = 'contractPolice';
const DIRECTIONS_INTENT = 'directions';
const FINGERPRINT_INTENT = 'fingerprint';
const HELICOPTER_INTENT = 'helicopterAlerts';
const HELP_INTENT = 'help';
const EMERGENCY_INTENT = 'helpEmergency';
const JOB_INTENT = 'jobApplication';
const OPTOUT_INTENT = 'optOut';
const PARKINGCITATION_INTENT = 'parkingCitation';
const PERMIT_INTENT = 'permit';
const PDFOUNDATION_INTENT = 'policeFoundation';
const PROPERTYOREVIDENCE_INTENT = 'propertyOrEvidence';
const REPORT_INTENT = 'report';
const SUBMITTIP_INTENT = 'submitTip';
const TOWEDVEHICLE_INTENT = 'towedVehicle';
const VOLUNTEER_INTENT = 'volunteer';

// Dialogflow Context names

// const ANSWER_CONTEXT = 'answer';

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




//  Police Precint Data
let precinct = 'Sacramento Police Department';
let address = '123 Cherry Tree Ln, Sacramento, CA';
let alerts = 'www.alerts.com/sacp';
let bikePermit = 'https://rideon.sacpd.org/index.aspx?ReturnUrl=%2f';
let phoneNumber = '555-555-5555';
let towedLink = 'www.towed.com';
let twitter = 'https://twitter.com/SacPolice?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor';
let facebook = 'https://www.facebook.com/SacramentoPoliceDepartment/';
let volunteerLink = 'https://www.cityofsacramento.org/Police/Participate/Volunteer-Program';
let jobsLink = 'www.jobs.com/sacp';
let foundation = 'http://sacpolicefoundation.org/wordpress/';
let parkingCitations = 'www.parking.com/sacp';
let submitTip = 'www.submittiphere.com';
let fingerPrintLink ='www.fingerprint.com';


exports.dialogflowFulfillmentAdvancedSample = functions.https.onRequest((request, response) => {
  console.log('Dialogflow Request headers: ' + JSON.stringify(request.headers));
  console.log('Dialogflow Request body: ' + JSON.stringify(request.body));
  const agent = new Agent({
    request: request,
    response: response
  });
  
  const actionMap = new Map();
  actionMap.set(WELCOME_ACTION, welcome);
  actionMap.set(DIRECTIONS, address);
  actionMap.set(CONTACT_INFO, contactInfo);
  actionMap.set(BIKE_PERMIT, permitLink);
  actionMap.set(ALERTS, alertsSend);
  actionMap.set(JOBS, jobs);
  agent.handleRequest(actionMap);

  function welcome(agent){
    agent.add(`Welcome to the ${precinct} assistant. I can help you find information about filing crime reports, applying for jobs and much more.`);
  }

// Address
  function address(agent) {
    agent.add(`${precinct}'s address is ${address}`);
  }

// Phone Number
  function contactInfo(agent) {
    agent.add(`The non-emergency phone numbers for ${precinct} can be found at this link ${phoneNumber}`);
  }

  // Links
  // Towing link
  function towed(agent) {
    agent.add(`You can get info on how to get your car back from ${towedLink}`);
  }

// Bike Permit
  function permits(agent) {
    agent.add(`You can get a bike permit at this link: ${bikePermit}`);
  }

// Social media
  function socialMedia(agent) {
    agent.add(`${precinct}'s twitter is ${twitter} and the Facebook page is ${facebook}`);
  }

// Jobs
  function jobs(agent) {
    agent.add(`${precinct}'s job listing page is ${jobsLink}`);
  }

//Volunteer
  function volunteer(agent) {
    agent.add(`${precinct}'s address is ${address}`);
  }
 
// Alerts
  function alerts(agent) {
    agent.add(`Alerts can be found at ${alertsLink}`);
  }

});
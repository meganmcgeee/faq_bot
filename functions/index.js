// Takes user input from dialogflow client and hits REST API depending on user input.
'use strict';

const http = require('https');

exports.civitasAIWebhook = (req, res) => {
  let content = req.body.result.parameters['content'];
// Reformats JSON data received from DialogFlow
  getInfo(content).then((output) => {
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ 'speech': output, 'displayText': output }));
  }).catch((error) => {
    // If there is an error let the user know
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ 'speech': error, 'displayText': error }));
  });
};
// 1) Processes user input, 
// 2) Determines user's needs based on content parameter 
// 3) Assigns a subject which corresponds to a branch of endpoint to route request

function getPrecinctInfo(content) {
  switch (content) {
    // SMS Notifications/ phone alerts for precinct
    case 'alerts' || 'notifications' || 'text messages':
      return { subject: "alerts", displayText: " crime alerts" };
      break;
    // Police Precinct App information
    case 'mobileApp' || 'police app' || 'download app':
      return { subject: "mobileApp", displayText: "the police smartphone app" };
      break;
    //  Police Precinct General Contact information
    case 'contact' || 'call' || 'e-mail' || 'social media':
      return { subject: "contact", displayText: "contacting the police" };
      break;
      // Fingerprinting information
    case 'fingerprint' || 'get fingerprinted' || 'finger print':
      return { subject: "fingerprint", displayText: "fingerprinting" };
      break;
      // Hire
    case 'hire' || 'hire police' || 'need security for event':
      return { subject: "hire", displayText: "hiring officers" };
      break;
      // Helicopter
    case 'helicopter' || 'helicopter overhead' || 'why is there a helicopter overhead':
      return { subject: "helicopter", displayText: "helicopters overhead" };
      break;
      // Jobs
    case 'job' || 'apply for a job' || 'job openings':
      return { subject: "job", displayText: "jobs with the force" };
      break;
      // Emergency
    case 'emergency' || 'danger' || '911':
      return { subject: "emergency", displayText: "emergencies. Call 911 immediately" };
      break;
      // Directions
    case 'directions' || 'how do I get to' || 'where is':
      return { subject: "directions", displayText: "directions to headquarters" };
      break;
      // Parking ticket
    case 'parking ticket' || 'parking citation' || 'pay parking ticket' || 'pay ticket':
      return { subject: "parkingCitation", displayText: "parking citation info." };
      break;
      // Foundation
    case 'foundation' || 'police foundation' || 'donating to or volunteering with the police foundation':
      return { subject: "foundation", displayText: "fingerprinting" };
      break;
      // Permit
    case 'permit' || 'parking permit' || 'gun permit':
      return { subject: "permit", displayText: "permits" };
      break;
      // Report
    case 'report' || 'report a crime' || 'file police report':
      return { subject: "report", displayText: "file a police report" };
      break;
      // Submit a tip
    case 'submitTip' || 'make annoymous tip' || 'submit a tip':
      return { subject: "submitTip", displayText: "on how to submit anonymous tip" };
      break;
    default:
      return { subject: "unknown", displayText: "something else" };
  }
}

// Hit Civitas AI Rest API based on user needs determined by function above
function getInfo(content) {
  let precinctInfo = getPrecinctInfo(content);
  return new Promise((resolve, reject) => {
    console.log('API Request: to Civitas AI API');
    http.get(`https://civitasai-api.herokuapp.com/jwtID/${precinctInfo["subject"]}`, (resp) => {
      // https://api.airtable.com/v0/app7iJQOL0H0Jhnlp/${precinctInfo["subject"]}?api_key=keyc2OX8QggglF0bK
      let data = '';
      resp.on('data', (chunk) => {
        data += chunk;
      });

      resp.on('end', () => {
        let response = JSON.parse(data);
        let thread = response["selfText"];

        let output = `${precinctInfo["displayText"]}: ${thread["title"]}`;

        if (precintInfo['subject'] == "alerts") {
          output += " " + thread["selfText"];
        }

        output += "\nCan I help you with anything else?"
        console.log(output);
        resolve(output);
      });
    }).on("error", (err) => {
      console.log("Error: " + err.message);
      reject(error);
    });
  });
}

// Takes user input from dialogflow client and hits REST API depending on user input.
'use strict';

const http = require('https');

exports.appWebHook = (req, res) => {
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
      return { sub: "alerts", displayText: " crime alerts" };
      break;
    // Police Precinct App information
    case 'app' || 'police app' || 'download app':
      return { sub: "app", displayText: "the police smartphone app" };
      break;
    //  Police Precinct General Contact information
    case 'contact' || 'call' || 'e-mail' || 'social media':
      return { sub: "contact", displayText: "contacting the police" };
      break;
      // Fingerprinting information
    case 'fingerprint' || 'get fingerprinted' || 'finger print':
      return { sub: "fingerprint", displayText: "fingerprinting" };
      break;
      // Hire
    case 'hire' || 'hire police' || 'need security for event':
      return { sub: "hire", displayText: "hiring officers" };
      break;
      // Helicopter
    case 'helicopter' || 'helicopter overhead' || 'why is there a helicopter overhead':
      return { sub: "helicopter", displayText: "helicopters overhead" };
      break;
      // Jobs
    case 'job' || 'apply for a job' || 'job openings':
      return { sub: "job", displayText: "jobs with the force" };
      break;
      // Emergency
    case 'emergency' || 'danger' || '911':
      return { sub: "emergency", displayText: "emergencies. Call 911 immediately" };
      break;
      // Directions
    case 'directions' || 'how do I get to' || 'where is':
      return { sub: "directions", displayText: "directions to headquarters" };
      break;
      // Parking ticket
    case 'parking ticket' || 'parking citation' || 'pay parking ticket' || 'pay ticket':
      return { sub: "parkingCitation", displayText: "parking citation info." };
      break;
      // Foundation
    case 'foundation' || 'police foundation' || 'donating to or volunteering with the police foundation':
      return { sub: "foundation", displayText: "fingerprinting" };
      break;
      // Permit
    case 'permit' || 'parking permit' || 'gun permit':
      return { sub: "permit", displayText: "permits" };
      break;
      // Report
    case 'report' || 'report a crime' || 'file police report':
      return { sub: "report", displayText: "file a police report" };
      break;
      // Submit a tip
    case 'submitTip' || 'make annoymous tip' || 'submit a tip':
      return { sub: "submitTip", displayText: "on how to submit anonymous tip" };
      break;
    default:
      return { sub: "unknown", displayText: "something else" };
  }
}

// Hit Civitas AI Rest API based on user needs determined by function above
function getInfo(content) {
  let precinctInfo = getPrecinctInfo(content);
  return new Promise((resolve, reject) => {
    console.log('API Request: to Civitas AI API');
    // http.get(`https://www.civitasai.com/api/precinctToken/${precinctInfo["sub"]}.json`, (resp) => {
    http.get(`https://www.reddit.com/r/${precinctInfo["sub"]}/top.json?sort=top&t=day`, (resp) => {
      let data = '';
      resp.on('data', (chunk) => {
        data += chunk;
      });

      resp.on('end', () => {
        let response = JSON.parse(data);
        let thread = response["data"]["children"][(Math.floor((Math.random() * 24) + 1))]["data"];

        let output = `If you are looking for help with ${content}, ${precinctInfo["displayText"]}: ${thread["title"]}`;

        if (precintInfo['sub'] == "jokes") {
          output += " " + thread["selftext"]; // selftext is the key of the property in the reddit example, see https://www.reddit.com/r/jokes/top.json?sort=top&t=day for JSON format that is processed in this expample
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
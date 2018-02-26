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
// Processes user input, assigns a subject to request
function getPrecinctInfo(content) {
  switch (content) {
    // SMS Notifications/ phone alerts for precinct
    case 'alerts' || 'notifications' || 'text messages':
      return { sub: "alerts", displayText: " crime alerts" };
      break;
    // Police Precinct App information
    case 'app' || 'police app' || 'download app':
      return { sub: "app", displayText: "police smartphone app" };
      break;
    //  Police Precinct General Contact information
    case 'contact' || 'call' || 'e-mail' || 'social media':
      return { sub: "contact", displayText: "contact information" };
      break;
      // Fingerprinting information
    case 'fingerprint' || 'get fingerprinted' || 'finger print':
      return { sub: "fingerprint", displayText: "fingerprinting" };
      break;
    default:
      return { sub: "unknown", displayText: "something else" };
  }
  // if (content == "funny" || content == "joke" || content == "laugh")
  //   return { sub: "jokes", displayText: "joke" };
  // else {
  //   return { sub: "todayILearned", displayText: "fact" };
  // }
}

function getInfo(content) {
  let precinctInfo = getPrecinctInfo(content);
  return new Promise((resolve, reject) => {
    console.log('API Request: to Civitas AI API');
    // http.get(`https://www.civitasai.com/precinctID/${precinctInfo["sub"]}.json`, (resp) => {
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
          output += " " + thread["selftext"];
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



//   function welcome(agent) {
//     agent.add(`Welcome to the ${precinct} assistant. I can help you find information about filing crime reports, applying for jobs and much more.`);
//   }

//   // Address
//   function address(agent) {
//     agent.add(`${precinct}'s address is ${address}`);
//   }

//   // Phone Number
//   function contactInfo(agent) {
//     agent.add(`The non-emergency phone numbers for ${precinct} can be found at this link ${phoneNumber}`);
//   }

//   // Links
//   // Towing link
//   function towed(agent) {
//     agent.add(`You can get info on how to get your car back from ${towedLink}`);
//   }

//   // Bike Permit
//   function permits(agent) {
//     agent.add(`You can get a bike permit at this link: ${bikePermit}`);
//   }

//   // Social media
//   function socialMedia(agent) {
//     agent.add(`${precinct}'s twitter is ${twitter} and the Facebook page is ${facebook}`);
//   }

//   // Jobs
//   function jobs(agent) {
//     agent.add(`${precinct}'s job listing page is ${jobsLink}`);
//   }

//   //Volunteer
//   function volunteer(agent) {
//     agent.add(`${precinct}'s address is ${address}`);
//   }

//   // Alerts
//   function alerts(agent) {
//     agent.add(`Alerts can be found at ${alertsLink}`);
//   }

// });
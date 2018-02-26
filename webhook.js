// Reddit Tops Today Bot
// https://velotio.com/blog/2017/12/19/making-a-reddit-chatbot-using-dialogflow
// Takes user input, asks whether they want to hear jokes or facts, Hits reddit API
'use strict';

const http = require('https');

exports.appWebHook = (req, res) => {
  let content = req.body.result.parameters['content'];

  getInfo(content).then((output) => {
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ 'speech': output, 'displayText': output }));
  }).catch((error) => {
    // If there is an error let the user know
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({ 'speech': error, 'displayText': error }));
  });
};

function getPrecinctInfo(content) {
  if (content == "funny" || content == "joke" || content == "laugh")
    return { sub: "jokes", displayText: "joke" };
  else {
    return { sub: "todayILearned", displayText: "fact" };
  }
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

        let output = `If you are looking for help with ${precinctInfo["displayText"]}: ${thread["title"]}`;

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
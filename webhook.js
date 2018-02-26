// Reddit Tops Today Bot
// https://velotio.com/blog/2017/12/19/making-a-reddit-chatbot-using-dialogflow
// Takes user input, asks whether they want to hear jokes or facts, Hits reddit API
'use strict';

const http = require('https');

exports.appWebHook = (req, res) => {
  let content = req.body.result.parameters['content'];

  getContent(content).then((output) => {
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

function getContent(content) {
  let precinctInfo = getPrecinctInfo(content);
  return new Promise((resolve, reject) => {
    console.log('API Request: to Reddit');
    http.get(`https://www.reddit.com/r/${precinctInfo["sub"]}/top.json?sort=top&t=day`, (resp) => {
      let data = '';
      resp.on('data', (chunk) => {
        data += chunk;
      });

      resp.on('end', () => {
        let response = JSON.parse(data);
        let thread = response["data"]["children"][(Math.floor((Math.random() * 24) + 1))]["data"];

        let output = `Here's a ${precinctInfo["displayText"]}: ${thread["title"]}`;

        if (precicntInfo['sub'] == "jokes") {
          output += " " + thread["selftext"];
        }

        output += "\nWhat do you want to hear next, a joke or a fact?"
        console.log(output);
        resolve(output);
      });
    }).on("error", (err) => {
      console.log("Error: " + err.message);
      reject(error);
    });
  });
}
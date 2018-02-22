<template>
  <section id="app">
    <!-- Bot Window -->
        <!-- Chat window -->
        <table v-for="a in answers">
        <!-- User messages -->
          <tr>
            <td id="user-says" class="to message">
              {{a.result.resolvedQuery}}
            </td>
          </tr>
        <!-- Bot messages -->
          <tr>
            <td id="bot-says" class="to from">
        <!-- Bot message types / Speech -->
              <div v-if="a.result.fulfillment.speech">
                {{a.result.fulfillment.speech}}
              </div>
        <!-- Google Assistant Output Support for Rich UI Features-->
          <!-- Card Messages -->
              <div v-if="r.type == 'basic_card'">
                <img :title="r.image.accessibilityText" :alt="image.accessibilityText" :src="r.image.url" v-if="r.image">
                <section>
                  <h1>{{r.title}}</h1>
                  <br>
                  <h2>{{r.subtitle}}</h2>
                </section>
                <section>
                  {{r.formattedText}}
                </section>
                <section v-for="button in r.buttons">
                  <a target="_blank" :href="button.openUrlAction.url">{{button.title}}<i class="material-icons openlink">
                    open_in_new</i></a>
                </section>
              </div>
          <!-- List Messages -->
              <div v-if="r.type == 'list_card'">
                <h3>{{r.title}}</h3>
                  <ul v-for="item in r.items" @click="autosubmit(item.optionInfo.key)">
                    <li class="mdc-list-item">
                      <img :title="item.image.accessibilityText" :alt="item.image.accessibilityText" class="mdc-list-item__start-detail" width="56" height="56" :src="item.image.url" v-if="item.image"/>
                      <span class="mdc-list-item__text">
                          {{item.title}}
                        <span>{{item.description}}</span>
                      </span>
                    </li>
                  </ul>
                </div>
          <!-- Link Chips -->
          
            </td>
          </tr>
        </table>
      <!-- User Input Box and Send Button -->
      <div class="query" id="user-input">
        <input aria-label="Ask me something" 
          autocomplete="off" 
          v-model="query" 
          class="queryform" 
          @keyup.enter="submit()" 
          placeholder="Ask me something..." 
          autofocus type="text"
          this.text = ""
          >
        <button id="send">Send</button>
      </div>
    </div>
  </section>
</template>

// Style 
<style lang="sass" scoped>
  #app
    max-width: 500px
    margin: 5%
    padding: 20px
    border: 2px #dddddd solid
    border-radius: 10px
    max-height: 700px
  #closed-chat
    padding-top: 4px
  .message 
    border-radius: 50px
    margin: 0 15px 10px
    padding: 15px 20px
    position: relative
    font-weight: bold
  .message.to
      background-color: #2095FE
      color: #fff
      margin-left: 100px
      text-align: right
  .message.from
      background-color: #E5E4E9
      color: #363636
      margin-right: 100px
  .message.to + .message.to
  .message.from + .message.from
    margin-top: -10px
  #user-data
    border: #000000 solid

  </style>

// Bot Logic
<script>
// DialogFlow Tokens
  import { ApiAiClient } from 'api-ai-javascript'

  const client = new ApiAiClient({accessToken: '19f84cd37041402487c92dd234f9f544'}) // <- replace it with yours
    // Firebase Initialization
    // const db = firebase.initializeApp({
    //     databaseURL: 'https://vuefiredemo.firebaseio.com'
    //   }).database()
    // let users = db.ref('users')


export default {
  // Bot/ Dialogflow Logic
    name: 'app',
    data: function(){
      return{
        answers: [],
        query: '',
        // speech: 'Go ahead, im listening...',
        // micro: false,
        // muted: false,
        online: navigator.onLine
      }
    },
    methods: {
      submit(){
        client.textRequest(this.query).then((response) =>{
          this.answers.push(response)
          this.handle(response)
          this.query = ''
          // this.speech = 'Go ahead, I am listening'
        })
      }
      autosubmit(suggestion){
        this.query = suggestion
        this.submit()
      },
              mute(mode){
            this.muted = mode
        },
        microphone(mode){
            this.micro = mode
            let self = this // <- correct scope

            if(mode == true){
                let recognition = new webkitSpeechRecognition() // <- chrome speech recognition

                recognition.interimResults = true
                recognition.lang = 'en-US'
			    recognition.start()

                recognition.onresult = function(event){
			        for (var i = event.resultIndex; i < event.results.length; ++i){
			    	    self.speech = event.results[i][0].transcript
			        }
			    }

			    recognition.onend = function(){
				    recognition.stop()
                    self.micro = false
                    self.autosubmit(self.speech)
			    }

    }
    }
  }
</script>



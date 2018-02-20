<template>
  <section id="app">
    <!-- Bot Window -->
        <!-- Chat window -->
        <table v-for="a in answers">
        <!-- User messages -->
          <tr>
            <td id="user-says" class="to message">{{a.result.resolvedQuery}}</td>
          </tr>
        <!-- Bot messages -->
          <tr>
            <td id="bot-says" class="to from">
        <!-- Bot message types / Speech -->
              <div v-if="a.result.fulfillment.speech">
                {{a.result.fulfillment.speech}}
              </div>
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
        <button>Send</button>
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

  const client = new ApiAiClient({accessToken: 'dd67cd4830ff41999f703e816ef02b04'}) // <- replace it with yours
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
        // speech: 'Go ahead, I am listening',
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
    }
    // Firebase logic
  }
</script>



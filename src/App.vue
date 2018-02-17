<template>
  <section id="app">
    <!-- Bot Window -->
      <div id="dialog-frame">
        <!-- Chat window -->
        <table v-for="a in answers">
        <!-- User messages -->
          <tr>
            <td id="user-says">{{a.result.resolvedQuery}}</td>
          </tr>
        <!-- Bot messages -->
            <tr>
            <td id="bot-says">
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
          autofocus type="text">
        <button>Send</button>
      </div>
    </div>
  </div>
  </section>
</template>

// Style 
<style lang="sass" scoped>
</style>

// Bot Logic
<script>
  import { ApiAiClient } from 'api-ai-javascript'
  const client = new ApiAiClient({accessToken: 'dd67cd4830ff41999f703e816ef02b04'}) // <- replace it with yours


  export default {
    name: 'app',
    data: function(){
      return{
        answers: [],
        query: '',
        speech: 'Go ahead, I am listening',
      }
    },
    methods: {
      submit(){
        client.textRequest(this.query).then((response) =>{
          this.answers.push(response)
          this.handle(response)

          this.query = '',
          this.speech = 'Go ahead, I am listening'
        })
      }
    }

  }
</script>



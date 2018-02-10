<template>
  <section id="app">
    <!-- Bot Window -->
        <div id="dialog-frame">
         <!-- Chat window -->
          <table v-for="a in answers">
          <!-- User messages -->
            <tr>
              <td>{{a.result.resolvedQuery}}</td>
            </tr>
          <!-- Bot messages -->
             <tr>
              <td>
          <!-- Bot message types / Speech -->
                <div v-if="a.result.fulfillment.speech">
                  {{a.result.fulfillment.speech}}
                </div>
          <!-- Google Assistant output -->
                <div v-for="r in a.result.fulfillment.messages">

            <!-- Card Answer-->
                  <div v-if="r.type == 'basic_card'">
                    <img :title="r.image.accessibilityText" :alt="r.image.accessibilityText" :src="r.image.url" v-if="r.image">
                    <section>
                      <h1>{{r.title}}</h1>
                      <br>
                        <h2>{{r.subtitle}}</h2>
                    </section>
                    <section>
                      {{r.formattedText}}
                    </section>
                    <section v-for="button in r.buttons">
                      <a target="_blank" :href="button.openUrlAction.url">{{button.title}}>
                        <i>Open in new window</i>
                      </a>
                    </section>
                  </div>
            <!-- Link Answer -->
                  <div v-if="r.type == 'link_out_chip'" class="chips">
                    <a class="suggestion link" :href="r.url" target="_blank">
                      {{r.destinationName}} <i class="openlink">open_in_new</i>
                    </a>
                  </div>
            <!-- Suggestion Chip -->
                  <div v-if="r.type == 'suggestion_chips'" class="chips">
                    <div class="suggestion" @click="autosubmit(s.title)" v-for="s in r.suggestions">
                      {{s.title}}
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </table>
        <!-- User Input Box and Send Button -->
        <div class="query" id="user-input">
          <input aria-label="Ask me something" autocomplete="off" v-model="query" class="queryform" @keyup.enter="submit()" placeholder="Ask me something..." autofocus type="text">
          <button>Send</button>
        </div>
      </div>
      <!-- <div id="fade" class="black_overlay"></div> -->
  </section>
</template>

// Style Imports
<style lang="sass" scoped>
  @import './components/style/bot_says.sass'
  @import './components/style/input.sass'
  @import './components/style/window.sass'

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
    watch: {
      answers: function(val){
        setTimeout(() => {
          document.querySelector('#query').scrollIntoView({
            behavior: 'smooth'
          })
        }, 2)
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



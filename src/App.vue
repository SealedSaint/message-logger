<template>dood
  <div class="flex-col-center">
    <button @click="getMessages">Get Messages</button>
    <div>Enter a Message</div>
    <input
      class="message-input"
      v-model="inputMessage"
      @keyup.enter="addMessage"
    />
    <div class="message-block" v-for="messageObj in messages">
      <div>{{ messageObj.message }}</div>
      <div class="message-date">{{ new Date(messageObj.date).toString() }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data() {
    return {
      inputMessage: '',
      messages: [],
      apiURI: `${this.$config.API_URI}/messages`,
    }
  },
  methods: {
    addMessage() {
      // Only if there is content
      const message = this.inputMessage.trim()
      if (!message.length) return;

      const payload = {
        date: new Date(),
        message: message,
      };

      this.$http.post(this.apiURI, payload)
        .then(res => {
          console.log('addMessage succeeded: ', res);
          this.messages.unshift(payload);
          this.inputMessage = '';
        })
        .catch(err => {
          console.error('addMessage failed: ', err);
        })
    },
    getMessages() {
      console.log('Fetching messages...');
      this.$http.get(this.apiURI)
        .then(res => {
          console.log('getMessages succeeded: ', res);
          this.messages = res.body.reverse();
        })
        .catch(err => {
          console.error('getMessages failed: ', err);
        });
    },
  },
  mounted() {

  },
}
</script>

<style lang="scss">
  .flex-col-center {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .message-input {
    width: 250px;
    margin-bottom: 15px;
  }
  .message-block {
    text-align: center;
    margin: 5px;
    border: 1px solid black;

    .message-date {
      color: grey;
      font-size: .8em;
    }
  }
</style>

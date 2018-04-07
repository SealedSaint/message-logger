<template>
  <div class="flex-col-center">
    <div>Enter a Message</div>
    <input
      class="message-input"
      v-model="inputMessage"
      @keyup.enter="addMessage"
    />
    <div class="message-block" v-for="messageObj in messages">
      <div>{{ messageObj.message }}</div>
      <div class="message-date">{{ messageObj.date.toString() }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data() {
    return {
      inputMessage: '',
      messages: [
        { date: new Date(), message: 'blah' },
      ],
    }
  },
  methods: {
    addMessage(e) {
      this.messages.unshift({
        date: new Date(),
        message: this.inputMessage,
      });
      this.inputMessage = '';
    },
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

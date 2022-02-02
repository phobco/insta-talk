import consumer from "./consumer"

consumer.subscriptions.create("UsersOnlineChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    let users = document.getElementById('users')
    
    if (users) {
      users.innerHTML = ''

      let result = new DocumentFragment()

      data['object'].forEach((element) => {
        let li = document.createElement('li')
        li.append(element['nickname'])
        result.append(li)
      })
  
      users.append(result)
    }
  },

  speak: function(data) {
    return this.perform('speak', {
      object: data
    })
  }
})

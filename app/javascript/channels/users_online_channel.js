import consumer from "./consumer"

function findOrAppendTag(user, ul) {
  for (const li of ul.children) {
    if (user['nickname'] === li.innerText) {
      return
    }
  }

  let li = document.createElement('li')

  li.append(user['nickname'])
  ul.append(li)
}

function removeTag(user, ul) {
  for (const li of ul.children) {
    if (user['nickname'] === li.innerText) {
      li.remove()
    }
  }
}

consumer.subscriptions.create("UsersOnlineChannel", {
  connected() {
    console.log('Connected USERS_ONLINE')
  },

  disconnected() {
    console.log('DISCONNECTED')
  },

  received(data) {
    const ul = document.getElementById('users')

    if (ul) {
      let user = data['object']
      
      user['online'] ? findOrAppendTag(user, ul) : removeTag(user, ul)
    }
  },

  speak: function(data) {
    return this.perform('broadcast', {
      object: data
    })
  }
})

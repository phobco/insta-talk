import consumer from "./consumer"

function findOrAppendTag(user, ul) {
  for (const li of ul.children) {
    if (user['id'] == li.id) {
      return
    }
  }

  let li = document.createElement('li')

  li.append(user['nickname'])
  li.id = user['id']
  ul.append(li)
}

function removeTag(user, ul) {
  for (const li of ul.children) {
    if (user['id'] == li.id) {
      li.remove()
    }
  }
}

consumer.subscriptions.create("UsersOnlineChannel", {
  connected() {
  },

  disconnected() {
  },

  received(user) {
    const ul = document.getElementById('users')

    if (ul) {
      user['online'] ? findOrAppendTag(user, ul) : removeTag(user, ul)
    }
  }
})

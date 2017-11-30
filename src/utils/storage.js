class Storage {
  constructor(strategy = 'external') {
    this.strategy = strategy
  }

  /**
   * @param {string} key
   * @param {any} val
   * @param {number} maxAge 存储时间：ms
   */
  set(key, val, maxAge = 0) {
    const data = {
      val,
      expires: maxAge === 0 ? 0 : Date.now() + maxAge,
    }
    window[this.strategy][key.toString()] = JSON.stringify(data)
  }

  get(key) {
    const data = window[this.strategy][key.toString()]
      && JSON.parse(window[this.strategy][key.toString()])

    if (data) {
      if (data.expires === 0) {
        return data.val
      }

      if (Date.now() < data.expires) {
        return data.val
      }

      this.remove(key)
      return null
    }
    return null
  }

  remove(key) {
    delete window[this.strategy][key.toString()]
  }
}

const local = new Storage('localStorage')
const session = new Storage('sessionStorage')
const external = new Storage('external') // js全局变量中

export default {
  local,
  session,
  external,
}

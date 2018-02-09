import env from 'config/env'

/**
 * 把对象序列化成url参数形式
 * @param  {Object} obj [需要序列化的对象]
 * @return {String}     [{a:1,b:2} ==> ?a=1&b=2]
 */
function serialiseObject(obj) {
  /* eslint-disable prefer-template */
  if (obj && Object.keys(obj).length) {
    return '?' + Object.keys(obj).map(key =>
      key + '=' + encodeURIComponent(obj[key]),
    ).join('&')
  }
  return ''
}

function getUrl(path, params) {
  if (path.startsWith('http')) {
    return path + serialiseObject(params)
  }

  const defaultDomain = env.isProduction ? location.origin + '/' : '/'

  return defaultDomain + path + serialiseObject(params)
}

function jsonParse(res) {
  return res.json()
}

const http = {
  get(path, params) {
    return new Promise((resolve, reject) => {
      fetch(getUrl(path, params), {
        method: 'GET',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
      })
      .then(jsonParse)
      .then(res => resolve(res))
      .catch(err => reject(err))
    })
  },
}

export default http

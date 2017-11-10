/**
 * 获取URL参数
 * // http://jsfiddle.net/draft/?foo=foo&bar=bar
    console.log(getUrlParams('foo')); // "foo"
    console.log(getUrlParams()); // {foo: "foo", bar: "bar"}
 */
function getUrlParams(name) {
  const params = {}
  const search = window.location.search

  search.replace(/[?&]+([^=&]+)=([^&]*)/gi, (str, key, value) => {
    params[key] = value
  })

  return params[name] || params
}

export default getUrlParams

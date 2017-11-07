import route from 'riot-route'

const getPageName = (pagestr) => {
  const reg = /(?:[^/]+)(?=\.tag$)/
  return pagestr.match(reg)[0]
}

const getViews = () => require.context('./pages', true, /^\.\/.*\.tag$/)
  .keys().map(k => getPageName(k))

class Router {
  constructor() {
    this.currentView = null
    this.defaultView = 'home'
    this.views = getViews()

    route(this._handleRoute.bind(this))
    route.start(true)
  }

  _loadView(view) {
    if (this.currentView) {
      this.currentView.unmount(true)
    }

    riot.currentRouteName = view
    this.currentView = riot.mount('#app', view)[0]
  }

  _handleRoute(view) {
    if (this.views.indexOf(view) === -1) {
      return route(this.defaultView)
    }

    return this._loadView(view)
  }
}

export default new Router()

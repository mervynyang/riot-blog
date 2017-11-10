import 'whatwg-fetch'
import env from './config/env'
import './RiotControl'
import './stores'
import './riotTags'
import './router'
import './styles/main.scss'

if (!env.isProduction) {
  require('riot-hot-reload')
}

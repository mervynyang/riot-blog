import http from 'utils/http'

export function getConfig() {
  return http.get('api/siteConfig')
}

import http from 'utils/http'
import storage from 'utils/storage'

export default function getCategories() {
  const CACHE_KEY = 'categories'
  const categoriesCache = storage.session.get(CACHE_KEY)

  if (categoriesCache) {
    return Promise.resolve(categoriesCache)
  }

  return http.get('api/categories')
    .then((res) => {
      if (res.code === 1) {
        storage.session.set(CACHE_KEY, res.data)
        return res.data
      }

      throw res.info
    })
}

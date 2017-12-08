import http from 'utils/http'

export function getPostsByCate(categoryId, page = 1, pageSize = 9) {
  return http.get(`api/posts/${categoryId}`, { page, pageSize })
}

export function getPostById(id) {
  return http.get(`api/post/${id}`)
}

export function getPostComments() {

}

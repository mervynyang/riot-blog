import * as postApi from 'api/post'

class PostStore {
  constructor() {
    riot.observable(this)

    this.postsQueryData = {
      post: [],
      count: 0,
    }
    this.postHtml = ''
  }

  onPostQuery(categoryId, page, pageSize) {
    return postApi.getPostsByCate(categoryId, page, pageSize)
      .then((res) => {
        if (res.code === 1) {
          this.postsQueryData = res.data
        }
      })
  }

  onPostSelected(postId) {
    return postApi.getPostById(postId)
      .then((res) => {
        if (res.code === 1) {
          this.postHtml = res.data
        }
      })
  }
}

const instance = new PostStore()

instance.on('postQuery', (categoryId, page, pageSize) => {
  instance.onPostQuery(categoryId, page, pageSize)
    .then(() => {
      instance.trigger('postsListChanged', instance.postsQueryData)
    })
})

instance.on('postSelected', (postId) => {
  instance.onPostSelected(postId)
    .then(() => {
      instance.trigger('postChanged', instance.postHtml)
    })
})

riot.control.addStore(instance)

export default instance

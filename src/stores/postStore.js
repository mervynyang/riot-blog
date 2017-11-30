import * as postApi from 'api/post'

class PostStore {
  constructor() {
    riot.observable(this)

    this.posts = []
    this.postHtml = ''
  }

  onCateSelected(categoryId) {
    return postApi.getPostsByCate(categoryId)
      .then((res) => {
        if (res.code === 1) {
          this.posts = res.data
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

instance.on('cateSelected', (categoryId) => {
  instance.onCateSelected(categoryId)
    .then(() => {
      instance.trigger('postsCateChanged', instance.posts)
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

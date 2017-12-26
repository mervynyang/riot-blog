<card>
  <article class="card">
    <a class="card-content" if="{ opts.post.cover === '' }" href="{ url + post.uuid }">
      <h2 class="card-title">{ opts.post.title }</h2>
      <div class="card-body">
        { opts.post.brief }
      </div>
    </a>
    <a class="card-img-wrap" if="{ opts.post.cover !== '' }" href="{ url + post.uuid }">
      <img src="{ opts.post.cover }" alt="">
      <div class="card-img-title">{ opts.post.title }</div>
    </a>
    <div class="card-footer">
      <time>{ opts.post.publish_at }</time>
      <span class="tag"><i class="iconfont icon-label_fill"></i>{ opts.post.tags }</span>
    </div>
  </article>

  <script>
    import route from 'riot-route'
    import './card.scss'

    this.goPost = (uuid) => {
      route(`post?id=${uuid}`)
    }

    this.url = `${location.origin}/#/post?id=`
  </script>
</card>

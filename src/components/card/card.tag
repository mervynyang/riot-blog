<card>
  <article class="card">
    <div class="card-content" if="{ opts.cover === '' }">
      <h2 class="card-title">{ opts.title}</h2>
      <div class="card-body">
        <!-- {} -->
      </div>
    </div>
    <figure class="card-img-wrap" if="{ opts.cover !== '' }">
      <img src="https://picsum.photos/300/300" alt="">
    </figure>
    <div class="card-footer">
      <time>{ opts.publish_at }</time>
      <span class="tag"><i class="iconfont icon-label_fill"></i>{ opts.category_name }</span>
    </div>
  </article>

  <script>
    import './card.scss'

    console.log(this.opts)
  </script>
</card>

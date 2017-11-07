<card>
  <article class="card">
    <div class="card-content" if="{ opts.type !== 'image' }">
      <h2 class="card-title">测试标题hello</h2>
      <div class="card-body">
        <p>First paragraph of every text post is automatically formatted to look like a proper lead. No need to change it manually. Read more for typography showcas</p>
        <p>First paragraph of every text post is automatically formatted to look like a proper lead. No need to change it manually. Read more for typography</p>
      </div>
    </div>
    <figure class="card-img-wrap" if="{ opts.type == 'image' }">
      <img src="https://picsum.photos/300/300" alt="">
    </figure>
    <div class="card-footer">
      <time>2014-11-22</time>
      <span class="tag"><i class="iconfont icon-label_fill"></i>css</span>
    </div>
  </article>

  <script>
    import './card.scss'

    // console.log(this.opts)
  </script>
</card>

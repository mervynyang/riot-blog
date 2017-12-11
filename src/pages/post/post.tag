<post>
  <page-head></page-head>
  <main class="main">
    <div class="container post-container">
      <div class="post-content">
        <article class="post-main markdown-body" id="markdownBody">
          <loading show="{ showLoading }"></loading>
        </article>
        <!-- <div class="post-footer">
          <comment></comment>
        </div> -->
      </div>
    </div>
  </main>
  <page-footer></page-footer>
  <script>
    import * as postApi from 'api/post'
    import route from 'riot-route'
    import './post.scss'

    window.scrollTo(0, 0)

    this.html = ''
    this.showLoading = true

    const id = route.query().id
    const div = document.createElement('div')

    postApi.getPostById(id)
      .then((res) => {
        if (res.code === 1) {
          div.innerHTML = res.data
          document.getElementById('markdownBody').appendChild(div)

          document.querySelectorAll('#markdownBody pre').forEach((block) => {
            hljs.highlightBlock(block)
          })

          this.showLoading = false
          this.update()
        }
      })
  </script>
</post>

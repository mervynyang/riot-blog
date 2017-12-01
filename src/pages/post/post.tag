<post>
  <page-head></page-head>
  <loading></loading>
  <main class="main">
    <div class="container">
      <div class="post-content">
        <article class="post-main markdown-body" id="markdownBody">
        </article>
        <div class="post-footer">
          <comment></comment>
        </div>
      </div>
    </div>
  </main>
  <page-footer></page-footer>
  <script>
    import * as postApi from 'api/post'
    import route from 'riot-route'
    import './post.scss'

    this.html = ''

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
        }
      })
  </script>
</post>

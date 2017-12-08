<home>
  <page-head></page-head>
  <main class="main">
    <page-main posts="{ posts }"></page-main>
    <pagination count="{ count }"></pagination>
  </main>
  <page-footer></page-footer>

  <script>
  this.mixin('controlMixin')

  this.posts = []

  this.onControl('postsListChanged', (data) => {
    this.posts = data.posts
    this.count = data.count
    this.update()
  })

  </script>
</home>


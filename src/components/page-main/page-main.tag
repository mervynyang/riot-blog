<page-main>
  <div class="container page-main">
    <card each="{ post in posts }" post="{ post }"></card>
  </div>

  <script>
    import './page-main.scss'

    this.mixin('controlMixin')

    this.posts = []

    this.onControl('postsCateChanged', (posts) => {
      this.posts = posts
      this.update()
    })
  </script>
</page-main>

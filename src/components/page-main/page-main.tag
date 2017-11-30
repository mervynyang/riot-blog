<page-main>
  <div class="container page-main">
    <card type="image" each="{ post in posts }" data="{ post }"></card>
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

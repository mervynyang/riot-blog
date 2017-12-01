<page-head>
  <div class="page-head">
    <div class="container">
      <div class="page-banner">
        <h1 class="page-title">
        世界尽头与冷酷仙境
        </h1>
        <div class="page-description">
          A hipster grid based tumblr theme
        </div>
      </div>
      <ul class="page-nav">
        <li each="{ category in categories }" no-reorder>
          <span onclick="{ categorySelect.bind(this, category.id) }">
            { category.name }
          </span>
        </li>
      </ul>
    </div>
  </div>

  <script>
  import route from 'riot-route'
  import getCategories from 'api/category'
  import './page-head.scss'

  const allCate = [{
    id: 'all',
    name: '所有文章'
  }]

  this.mixin('controlMixin')

  const queryId = route.query().cate

  riot.control.trigger('cateSelected', queryId || 'all')

  getCategories()
    .then((categories) => {
      this.update({
        categories: allCate.concat(categories)
      })
    })

  this.categorySelect = (categoryId) => {
    riot.control.trigger('cateSelected', categoryId)
    route(`home?cate=${categoryId}`)
  }
  </script>
</page-head>

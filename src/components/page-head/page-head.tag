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
          <span
            onclick="{ categorySelect.bind(this, category.id) }"
            class="{ nav-active: category.id == queryId }">
            { category.name }
          </span>
        </li>
      </ul>

      <!-- mobile nav  -->
      <i class="iconfont icon-menu" onclick="{ toggleMenu }"></i>
      <ul class="{ 'm-page-nav': true, expanded: menuExpand }">
        <li
          each="{ category in categories }"
          no-reorder
          onclick="{ categorySelect.bind(this, category.id) }"
          class="{ nav-active: category.id == queryId }"
        >
          { category.name }
        </li>
      </ul>
      <!-- end mobile nav  -->

    </div>
  </div>

  <script>
  import route from 'riot-route'
  import getCategories from 'api/category'
  import storage from 'utils/storage'
  import './page-head.scss'

  const allCate = [{
    id: 'all',
    name: '所有文章'
  }]

  const sessionCateId = storage.session.get('categoryId')
  this.queryId =  route.query().cate || sessionCateId || 'all'
  this.menuExpand = false

  riot.control.trigger('postQuery', this.queryId)

  getCategories()
    .then((categories) => {
      this.update({
        categories: allCate.concat(categories)
      })
    })

  this.categorySelect = (categoryId) => {
    storage.session.set('categoryId', categoryId)
    riot.control.trigger('postQuery', categoryId)
    route(`home?cate=${categoryId}`)
  }

  this.toggleMenu = () => {
    this.menuExpand = !this.menuExpand
  }

  </script>
</page-head>

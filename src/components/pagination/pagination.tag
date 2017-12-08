<pagination>
  <div class="pagination">
    <i
      onclick="{ prev }"
      class="{ 'iconfont': true, 'icon-arrowleft': true, disabled: currentPage == first }"
    >
    </i>
    <span>Page { currentPage } of { last }</span>
    <i
      onclick="{ next }"
      class="{ 'iconfont': true, 'icon-arrowright': true, disabled: currentPage == last }"
    >
    </i>
  </div>

  <script>
    import route from 'riot-route'
    import './pagination.scss'

    const PAGE_SIZE = 9
    const count = opts.count
    const categoryId = route.query().cate

    this.first = 1
    this.currentPage = 1

    this.on('update', () => {
      this.last = Math.ceil(opts.count / PAGE_SIZE)
    })

    this.next = () => {
      if (this.currentPage < this.last) {
        this.currentPage += 1
        riot.control.trigger('postQuery', categoryId, this.currentPage)
      }
    }

    this.prev = () => {
      if (this.currentPage > this.first) {
        this.currentPage -= 1
        riot.control.trigger('postQuery', categoryId, this.currentPage)
      }
    }
  </script>
</pagination>

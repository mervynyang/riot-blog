<loading>
  <div class="lds-css" if="{ show }">
    <div style="width:100%;height:100%" class="lds-wedges">
      <div>
        <div>
          <div></div>
        </div>
        <div>
          <div></div>
        </div>
        <div>
          <div></div>
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </div>
  </div>

  <script>
  import './loading.scss'

  this.show = opts.show
  </script>
</loading>

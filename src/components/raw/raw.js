import unwrapRiotTag from 'utils/unwrapRiotTag'

riot.tag('raw', '', function raw(opts) {
  this.updateContent = () => {
    this.root.innerHTML = opts.content
  }

  this.on('update', () => {
    this.updateContent()
  })

  this.on('mount', unwrapRiotTag)

  this.updateContent()
})


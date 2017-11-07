/**
 * this.on('mount', unwrapRiotTag)
 * 去除外部包裹的自定义标签
 */
function unwrapRiotTag() {
  const inside = this.root
  const outside = inside.parentNode

  while (inside.lastChild) {
    outside.insertBefore(inside.lastChild, inside.nextSibling)
  }

  inside.remove()
}

export default unwrapRiotTag

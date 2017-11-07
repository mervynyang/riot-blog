function requireAll(requireContext) {
  return requireContext.keys().map(requireContext)
}

// 引入所有的tag
requireAll(require.context('./components', true, /^\.\/.*\.(tag|js)$/))
requireAll(require.context('./pages', true, /^\.\/.*\.tag$/))

export default {
  isProduction: process.env.NODE_ENV === 'production',
  isMobile: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent),
}

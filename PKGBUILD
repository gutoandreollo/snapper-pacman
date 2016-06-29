# Maintainer: Guto Andreollo <gutoandreollo@users.noreply.github.com>

pkgname=snapper-pacman-git
pkgver=r5.fe30494
pkgrel=1
pkgdesc='Automated pre- and post- pacman transaction snapshots with snapper'
arch=('any')
url='https://github.com/gutoandreollo/snapper-pacman'
license=('public')
depends=('snapper')
makedepends=('git')
source=('snapper-pacman::git+https://github.com/gutoandreollo/snapper-pacman')
md5sums=('SKIP')

package() {
  mkdir -pv ${pkgdir}/usr/share/libalpm/hooks ${pkgdir}/usr/local/bin ${pkgdir}/usr/share/doc/${pkgname}
  install -v -m 755 ${srcdir}/${pkgname%-git}/*.sh ${pkgdir}/usr/local/bin
  install -v -m 644 ${srcdir}/${pkgname%-git}/*.hook ${pkgdir}/usr/share/libalpm/hooks/
  install -v -m 644 ${srcdir}/${pkgname%-git}/*.md ${pkgdir}/usr/share/doc/${pkgname}

}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }


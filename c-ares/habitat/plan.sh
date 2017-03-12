pkg_name=c-ares
pkg_origin=jonathantron
pkg_version="1.12.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('MIT')
pkg_source="https://c-ares.haxx.se/download/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
pkg_deps=(core/glibc)
pkg_build_deps=(core/make core/gcc)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_prepare() {
  # c-ares only allows CFLAGS to set CC...
  unset CFLAGS
}

do_build() {
  ./configure \
    --prefix=$pkg_prefix \
    --enable-shared \
    --disable-tests
  make
  return $?
}

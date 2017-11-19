pkg_name=hashdeep
pkg_origin=jonathantron
pkg_version="4.3"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('GPL-2.0')
pkg_source="https://github.com/jessek/hashdeep/archive/v${pkg_version}.tar.gz"
pkg_shasum="a2dab1df569598fc910b17ae0e9bbde1bbe05209259e7d9471f9492532b58e2c"
pkg_deps=(core/glibc core/gcc-libs)
pkg_build_deps=(core/make core/gcc core/autoconf core/automake)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_prepare() {
  rm -f aclocal.m4
  autoheader -f
  touch NEWS README AUTHORS ChangeLog
  touch stamp-h
  aclocal
  autoconf -f
  automake --add-missing -c
}

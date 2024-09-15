pkg_origin=jonathantron
pkg_name=haproxy2
pkg_description="The Reliable, High Performance TCP/HTTP Load Balancer"
pkg_version=2.8.10
pkg_maintainer='Jonathan Tron <jonathan@tron.name>'
pkg_license=('GPL-2.0' 'LGPL-2.1')
pkg_source=http://www.haproxy.org/download/2.8/src/haproxy-${pkg_version}.tar.gz
pkg_upstream_url="http://git.haproxy.org/git/haproxy-2.8.git/"
pkg_dirname="haproxy-${pkg_version}"
pkg_shasum=0d63cd46d9d10ac7dbc02f3c6769c1908f221e0a5c5b655a194655f7528d612a
pkg_svc_run='haproxy -f config/haproxy.conf -db'
pkg_deps=(
  core/zlib
  core/pcre
  core/gcc-libs
  core/openssl11
)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/pcre
  core/make
  core/openssl11
  core/zlib
)
pkg_bin_dirs=(bin)
pkg_svc_user="root"

do_build() {
  make USE_PCRE=1 \
       USE_PCRE_JIT=1 \
       TARGET=linux-glibc \
       USE_OPENSSL=1 \
       USE_ZLIB=1 \
       ADDINC="$CFLAGS" \
       ADDLIB="$LDFLAGS"
}

do_install() {
  mkdir -p "$pkg_prefix"/bin
  cp haproxy "$pkg_prefix"/bin
}

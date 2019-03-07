pkg_origin=jonathantron
pkg_name=haproxy
pkg_description="The Reliable, High Performance TCP/HTTP Load Balancer"
pkg_version=1.8.19
pkg_maintainer='Jonathan Tron <jonathan@tron.name>'
pkg_license=('GPL-2.0' 'LGPL-2.1')
pkg_source=http://www.haproxy.org/download/1.8/src/haproxy-${pkg_version}.tar.gz
pkg_upstream_url="http://git.haproxy.org/git/haproxy-1.8.git/"
pkg_shasum=64f5fbfd4e09ffeaf26cb6667398ba780704a14e96e60000caa8bf69962ba734
pkg_svc_run='haproxy -f config/haproxy.conf -db'
pkg_deps=(core/zlib core/pcre core/openssl)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/pcre
  core/make
  core/openssl
  core/zlib
)
pkg_bin_dirs=(bin)
pkg_svc_user="root"

do_build() {
  make USE_PCRE=1 \
       USE_PCRE_JIT=1 \
       TARGET=linux2628 \
       USE_OPENSSL=1 \
       USE_ZLIB=1 \
       ADDINC="$CFLAGS" \
       ADDLIB="$LDFLAGS"
}

do_install() {
  mkdir -p "$pkg_prefix"/bin
  cp haproxy "$pkg_prefix"/bin
}

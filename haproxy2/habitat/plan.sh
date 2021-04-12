pkg_origin=jonathantron
pkg_name=haproxy2
pkg_description="The Reliable, High Performance TCP/HTTP Load Balancer"
pkg_version=2.2.13
pkg_maintainer='Jonathan Tron <jonathan@tron.name>'
pkg_license=('GPL-2.0' 'LGPL-2.1')
pkg_source=http://www.haproxy.org/download/2.2/src/haproxy-${pkg_version}.tar.gz
pkg_upstream_url="http://git.haproxy.org/git/haproxy-2.2.git/"
pkg_dirname="haproxy-${pkg_version}"
pkg_shasum=9e3e51441c70bedfb494fc9d4b4d3389a71be9a3c915ba3d6f7e8fd9a57ce160
pkg_svc_run='haproxy -f config/haproxy.conf -db'
pkg_deps=(
  core/zlib
  core/pcre
  core/gcc-libs
  jonathantron/openssl
)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/pcre
  core/make
  jonathantron/openssl
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

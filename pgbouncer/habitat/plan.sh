pkg_name=pgbouncer
pkg_origin=jonathantron
pkg_version="1.8.1"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('ISC')
pkg_source="https://pgbouncer.github.io/downloads/files/${pkg_version}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="fa8bde2a2d2c8c80d53a859f8e48bc6713cf127e31c77d8f787bbc1d673e8dc8"
pkg_deps=(
  core/glibc
  core/libevent
  core/openssl
  core/c-ares
)
pkg_build_deps=(
  core/autoconf
  core/make
  core/gcc
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
pkg_svc_run="pgbouncer $pkg_svc_config_path/pgbouncer.ini"
pkg_exports=(
  [port]=pgbouncer.listen_port
)
pkg_exposes=(
  port
)

do_build() {
  ./configure \
    --prefix=$pkg_prefix \
    --with-cares=yes
  make
  return $?
}

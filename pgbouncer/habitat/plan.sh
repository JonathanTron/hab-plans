pkg_name=pgbouncer
pkg_origin=jonathantron
pkg_version="1.7.2"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('ISC')
pkg_source="https://pgbouncer.github.io/downloads/files/${pkg_version}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="de36b318fe4a2f20a5f60d1c5ea62c1ca331f6813d2c484866ecb59265a160ba"
pkg_deps=(
  core/glibc
  core/libevent
  core/openssl
  jonathantron/c-ares
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

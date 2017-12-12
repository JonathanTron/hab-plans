pkg_name=prometheus-haproxy_exporter
pkg_origin=jonathantron
pkg_version="0.8.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/prometheus/haproxy_exporter/releases/download/v${pkg_version}/haproxy_exporter-${pkg_version}.linux-amd64.tar.gz"
pkg_dirname="haproxy_exporter-${pkg_version}.linux-amd64"
pkg_shasum="2b1da4218fc5a1531ed17663ba5656c6bb5ce3db0ad6c2bdd6781d7f1b545816"
pkg_deps=()
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_build() {
  return 0
}

do_install(){
  cp haproxy_exporter ${pkg_prefix}/bin/
}

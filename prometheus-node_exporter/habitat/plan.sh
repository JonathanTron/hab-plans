pkg_name=prometheus-node_exporter
pkg_origin=jonathantron
pkg_version="0.15.1"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/prometheus/node_exporter/releases/download/v${pkg_version}/node_exporter-${pkg_version}.linux-amd64.tar.gz"
pkg_dirname="node_exporter-${pkg_version}.linux-amd64"
pkg_shasum="7ffb3773abb71dd2b2119c5f6a7a0dbca0cff34b24b2ced9e01d9897df61a127"
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
  cp node_exporter ${pkg_prefix}/bin/
}

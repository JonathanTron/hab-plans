pkg_name=prometheus-node_exporter
pkg_origin=jonathantron
pkg_version="1.2.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/prometheus/node_exporter/releases/download/v${pkg_version}/node_exporter-${pkg_version}.linux-amd64.tar.gz"
pkg_dirname="node_exporter-${pkg_version}.linux-amd64"
pkg_shasum="f7ef26fb10d143dc4211281d7a2e8b13c4fe1bd0d7abbdff6735a6efdb4b5e56"
pkg_deps=()
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_svc_user="root"
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

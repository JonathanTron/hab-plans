pkg_name=coredns
pkg_origin=jonathantron
pkg_version="1.0.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/coredns/coredns/releases/download/v${pkg_version}/coredns_${pkg_version}_linux_amd64.tgz"
pkg_shasum="d7174af61a038817c329af314461f9a4022adcc1513dcc7895ee9dd8be89fe14"
pkg_deps=(core/cacerts)
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_exports=(
  [port]=port
  [prometheus_port]=prometheus_port
)
pkg_exposes=(port prometheus_port)

do_build() {
  return 0
}

do_install(){
  cp ../coredns ${pkg_prefix}/bin/
}

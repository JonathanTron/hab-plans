pkg_name=coredns
pkg_origin=jonathantron
pkg_version="1.8.4"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/coredns/coredns/releases/download/v${pkg_version}/coredns_${pkg_version}_linux_amd64.tgz"
pkg_shasum="aede302ae591c9747040e10dc749d144df4812bd8bb141041d3d24c6204f309d"
pkg_deps=(core/cacerts)
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_svc_user="root"
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

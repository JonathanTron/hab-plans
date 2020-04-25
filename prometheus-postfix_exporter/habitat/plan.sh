pkg_name=prometheus-postfix_exporter
pkg_origin=jonathantron
pkg_version="0.2.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/kumina/postfix_exporter/releases/download/${pkg_version}/postfix_exporter"
pkg_shasum="f1412ee7204cabbbaa54bc03d375fd1e6008392e7d52687cb334fab4da879bff"
pkg_deps=()
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_svc_user="root"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install(){
  cp ${HAB_CACHE_SRC_PATH}/postfix_exporter ${pkg_prefix}/bin/postfix_exporter
  chmod +x ${pkg_prefix}/bin/postfix_exporter
}

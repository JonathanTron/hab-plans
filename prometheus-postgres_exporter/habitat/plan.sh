pkg_name=prometheus-postgres_exporter
pkg_origin=jonathantron
pkg_version="0.4.7"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')

pkg_source="https://github.com/wrouesnel/postgres_exporter/releases/download/v${pkg_version}/postgres_exporter_v${pkg_version}_linux-amd64.tar.gz"
pkg_dirname="postgres_exporter_v${pkg_version}_linux-amd64"
pkg_shasum="c34d61bb4deba8efae06fd3c9979b96dae3f3c757698ce3384c80fff586c667b"
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
  cp postgres_exporter ${pkg_prefix}/bin/
}

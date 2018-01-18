gopkg="github.com/lovoo/ipmi_exporter"
pkg_name=prometheus-ipmi_exporter
pkg_origin=jonathantron
pkg_version="2.1.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('Apache-2.0')
pkg_source="https://$gopkg"
pkg_upstream_url=$pkg_source
pkg_build_deps=()
pkg_exports=(
  [port]=service.port
  [host]=service.host
)
pkg_deps=()
pkg_bin_dirs=(bin)
pkg_svc_user="root"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

pkg_scaffolding=core/scaffolding-go
scaffolding_go_base_path=github.com/lovoo
scaffolding_go_build_deps=(
  "https://github.com/prometheus/client_golang"
  "https://github.com/prometheus/common"
)

do_prepare() {
  build_line "GO_LDFLAGS=\"-w -X $gopkg/version.Version=$pkg_version\""
  export GO_LDFLAGS="-w -X $gopkg/version.Version=$pkg_version"
}

do_download() {
  # `-d`: don't let go build it, we'll have to build this ourselves
  build_line "go get -d $gopkg"
  go get -d $gopkg

  pushd "${scaffolding_go_gopath:?}/src/$gopkg"
    build_line "checking out $pkg_version"
    git reset --hard $pkg_version
  popd
}

do_build() {
  build_line "go build --ldflags \"${GO_LDFLAGS}\" -o $pkg_prefix/bin/ipmi_exporter $gopkg"
  go build --ldflags "${GO_LDFLAGS}" -o "$pkg_prefix/bin/ipmi_exporter" "$gopkg"
}

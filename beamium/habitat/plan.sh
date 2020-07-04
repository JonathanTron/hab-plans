pkg_name=beamium
pkg_origin=jonathantron
pkg_version="2.0.7"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('BSD-3-Clause')
pkg_source="https://github.com/ovh/beamium.git"
pkg_shasum=noshasum
pkg_deps=(
  core/gcc-libs
  core/glibc
  core/openssl
  core/cacerts
)
pkg_build_deps=(
  core/rust
  core/gcc
  core/gcc-libs
  core/glibc
  core/openssl
  core/cacerts
  core/git
)
pkg_bin_dirs=(bin)

do_setup_environment() {
  # Used by Cargo to use a pristine, isolated directory for all compilation
  # From: https://github.com/habitat-sh/habitat/blob/8b672dd39c28deb2060bf93c2ca59d574d8a0390/support/ci/builder-base-plan.sh
  set_buildtime_env CARGO_TARGET_DIR "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  # Ensure ssl certs are found by rust lib
  set_buildtime_env SSL_CERT_FILE "$(pkg_path_for cacerts)/ssl/cert.pem"
  # Used to compile cargo deps based on openssl
  set_buildtime_env OPENSSL_DIR "$(pkg_path_for openssl)"
}

do_download() {
  GIT_SSL_CAINFO="$(pkg_path_for core/cacerts)/ssl/certs/cacert.pem"
  export GIT_SSL_CAINFO

  REPO_PATH="$HAB_CACHE_SRC_PATH/$pkg_dirname"

  # removing any previous git repo under the same package name that was downloaded
  rm -rf "$REPO_PATH"

  git clone "$pkg_source" "$REPO_PATH"

  pushd "$REPO_PATH" || exit 1
  git checkout "tags/v${pkg_version}"
}

do_clean() {
  return 0
}

do_unpack() {
  return 0
}

do_verify() {
  return 0
}

do_build() {
  cargo build --release
}

do_install(){
  cp release/beamium ${pkg_prefix}/bin/
}

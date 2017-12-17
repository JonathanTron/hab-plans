pkg_name=beamium
pkg_origin=jonathantron
pkg_version="1.7.0"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('BSD-3-Clause')
pkg_source="https://github.com/ovh/beamium/archive/v${pkg_version}.tar.gz"
pkg_shasum="87201c3605c253b11f7cc4406673b57218bff7ab3d44e1767c3599fb80ae3590"
pkg_deps=(core/gcc-libs core/glibc core/openssl core/cacerts)
pkg_build_deps=(core/rust core/gcc core/gcc-libs core/glibc core/openssl core/cacerts core/git)
pkg_bin_dirs=(bin)

do_prepare() {
  # Used by Cargo to use a pristine, isolated directory for all compilation
  # From: https://github.com/habitat-sh/habitat/blob/8b672dd39c28deb2060bf93c2ca59d574d8a0390/support/ci/builder-base-plan.sh
  export CARGO_TARGET_DIR="$HAB_CACHE_SRC_PATH/$pkg_dirname"
  build_line "Setting CARGO_TARGET_DIR=$CARGO_TARGET_DIR"

  # Used to compile cargo deps based on openssl
  export OPENSSL_DIR=$(pkg_path_for openssl)
  build_line "Setting OPENSSL_DIR=$OPENSSL_DIR"
}

do_build() {
  cargo build --release
}

do_install(){
  cp release/beamium ${pkg_prefix}/bin/
}

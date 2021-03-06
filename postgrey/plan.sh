pkg_name=postgrey
pkg_origin=jonathantron
pkg_version="1.37"
pkg_maintainer="Jonathan Tron <jonathan@tron.name>"
pkg_license=('GPL')
pkg_source="http://postgrey.schweikert.ch/pub/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="ff4d9543f8f5cb0356c30ffe22255d942ac6128da734c376de211c02630fa5f7"
pkg_deps=(core/perl core/db)
pkg_build_deps=(core/make core/gcc core/sed core/local-lib core/cpanminus)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(sbin)
pkg_exports=(
  [port]=cli.inet_port
)
pkg_exposes=(port)
pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"
pkg_description="Postgrey - Postfix Greylisting Policy Server"
pkg_upstream_url="http://postgrey.schweikert.ch/"

do_prepare() {
  eval "$(perl -I$(pkg_path_for core/local-lib)/lib/perl5 -Mlocal::lib=$(pkg_path_for core/local-lib))"
  eval "$(perl -Mlocal::lib=${pkg_prefix})"

  cpanm \
    Net::Server \
    Net::DNS \
    IO::Multiplex \
    BerkeleyDB \
    Digest::SHA \
    NetAddr::IP \
    Parse::Syslog
}

do_build() {
  return 0
}

do_install(){
  mkdir -p "$pkg_prefix/sbin"

  perl_bin_path="$(pkg_path_for core/perl)/bin/perl"
  graylog_libs_path="${pkg_prefix}/lib/perl5"

  cp "$HAB_CACHE_SRC_PATH/$pkg_dirname/postgrey" "$pkg_prefix/sbin"
  sed \
    -e "s|#!/usr/bin/perl -T -w|#!${perl_bin_path} -I${graylog_libs_path} -T -w|" \
    -i "${pkg_prefix}/sbin/postgrey"

  cp "$HAB_CACHE_SRC_PATH/$pkg_dirname/policy-test" "$pkg_prefix/sbin"
  sed \
    -e "s|#!/usr/bin/perl -w|#!${perl_bin_path} -I${graylog_libs_path} -w|" \
    -i "${pkg_prefix}/sbin/policy-test"

  cp "$HAB_CACHE_SRC_PATH/$pkg_dirname/contrib/postgreyreport" "$pkg_prefix/sbin"
  sed \
    -e "s|#!/usr/bin/perl|#!${perl_bin_path} -I${graylog_libs_path}|" \
    -i "${pkg_prefix}/sbin/postgreyreport"
}

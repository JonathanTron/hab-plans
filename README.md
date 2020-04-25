# hab-plans

This repository contains [Habitat](https://habitat.sh) plans for the following
app and libs:

- [beamium](https://github.com/ovh/beamium): Prometheus to Warp10 metrics forwarder

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/beamium)

- [c-ares](https://c-ares.haxx.se): C library for asynchronous DNS requests

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/c-ares)

- [coredns](https://coredns.io/): DNS and Service Discovery

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/coredns)

- [haproxy](http://www.haproxy.org/): Branch 1.9.x - The Reliable, High Performance TCP/HTTP Load Balancer

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/haproxy)

- [haproxy2](http://www.haproxy.org/): Branch 2.0.x - The Reliable, High Performance TCP/HTTP Load Balancer

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/haproxy2)

- [hashdeep](https://github.com/jessek/hashdeep): This is md5deep, a set of cross-platform tools to compute hashes

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/hashdeep)

- [openssl](https://www.openssl.org/): Branch 1.1.x - Cryptography and SSL/TLS Toolkit

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/openssl)

- [pgbouncer](https://pgbouncer.github.io): Lightweight connection pooler for PostgreSQL

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/pgbouncer)

- [Prometheus haproxy exporter](https://github.com/prometheus/haproxy_exporter): Simple server that scrapes HAProxy stats and exports them via HTTP for Prometheus consumption

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/prometheus-haproxy_exporter)

- [Prometheus ipmi exporter](https://github.com/lovoo/ipmi_exporter): IPMI Exporter for prometheus.io, written in Go.

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/prometheus-ipmi_exporter)

- [Prometheus node exporter](https://github.com/prometheus/node_exporter): Exporter for machine metrics

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/prometheus-node_exporter)

- [Prometheus postfix exporter](https://github.com/kumina/postfix_exporter): A Prometheus exporter for Postfix.

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/prometheus-postfix_exporter)

- [Prometheus postgres exporter](https://github.com/kumina/postfix_exporter): A PostgresSQL metric exporter for Prometheus

  This package is released on [Habitat public depot](https://app.habitat.sh/#/pkgs/jonathantron/prometheus-postgres_exporter)

# Building packages

Install `Docker` and `hab-cli`.

In the root directory, run:

```bash
hab studio enter
```

Then to build a particular package go to its directory and run `build`:

```bash
cd beamium
build
```

# Testing in a VM:

Install [Vagrant](https://www.vagrantup.com/) and run in the root directory:

```bash
vagrant up
```

Once this is finished, you can connect to the VM via:

```bash
vagrant ssh
```

The VM will have the latest `hab-cli`, a hab user and group, as well as some of
the softwares helpful to test the habitat packages.

Your packages will be available at `/vagrant`, in order to test one you have to
start a supervisor first, the easiest to debug is to use screen/tmux/byobu or
simply open two tabs in your terminal and connect to the vagrant VM.

In first tab/pane:

```bash
sudo hab svc run
```

In the second tab/pane:

```bash
hab pkg install /vagrant/prometheus-postfix_exporter/results/jonathantron-prometheus-post
fix_exporter-0.2.0-20200425093937-x86_64-linux.hart
hab svc load jonathantron/prometheus-postfix_exporter
```

If you want to test with a different config than the default, create a config
file and apply it:

```
cat <<EOT >> postfix.toml
options=[
  "--web.telemetry-path '/metrics'",
  "--postfix.showq_path '/var/spool/postfix/public/showq'",
  "--postfix.logfile_path '/var/log/mail.log'"
]
EOT

cat postfix.toml | hab config apply prometheus-postfix_exporter.default $(date +%s)
```

Once done, you can either stop or completely destroy the VM:

```bash
# shutdown only
vagrant down

# remove it completely
vagrant destroy
```

# Sending package to [Habitat builder](https://habitat.sh)

Export your `Personal access token` for habitat builder and the `origin`:

```bash
export HAB_AUTH_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export HAB_ORIGIN=jonathantron
```

Then enter the studio again, and build your package, or if already done upload it.

```bash
hab studio enter
cd beamium
# Build the package, you can skip of already build before
build
# get the last build infos in env
source results/last_build.env
# upload package to habitat builder
hab pkg upload results/$pkg_artifact
```

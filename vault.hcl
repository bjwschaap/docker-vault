backend "file" {
  path = "/var/lib/vault"
}

listener "tcp" {
  /*
   * By default Vault listens on localhost only.
   * Make sure to enable TLS support otherwise.
   */
  address = "0.0.0.0:8200"
  tls_disable = 1
}
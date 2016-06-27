# docker-vault
A minimal Alpine Linux container to run [Hashicorp Vault](http://vaultproject.io).
This image takes the Vault version provided by Alpine [package management](https://pkgs.alpinelinux.org/packages?name=vault&branch=&repo=&arch=&maintainer=).

## Run from Docker Hub
You can run this image directly from Docker hub. This image does not include a
default configuration for vault, so you need to mount it yourself as a volume.
An example vault.hcl file is included in the Github repo.

In this example I made an explicit port mapping, but obviously you could automap
(`-P`) as well.

Out of the box Vault needs to be able to do some memory paging which
is not allowed in Docker by default. This is why we need the `-cap-add IPC_LOCK`
(also see [this issue](https://github.com/hashicorp/vault/issues/59)). If you
don't want to provide the container this capacity you can disable Vault from
using this feature by configuring `disable_mlock = true` (see:
[configuration guide](https://www.vaultproject.io/docs/config/#disable_mlock)),
however this is not recommended in production.

```
docker run -d -p 8200:8200 -v $(pwd)/vault.hcl:/etc/vault.hcl --cap-add IPC_LOCK --name vault bjwschaap/vault
```

## Build from source
Clone the repo:
```
git clone https://github.com/bjwschaap/docker-vault.git
cd docker-vault
```

Build the image:
```
docker build -t [yourname]/vault .
```

And run it:
```
docker run -d -p 8200:8200 -v $(pwd)/vault.hcl:/etc/vault.hcl --cap-add IPC_LOCK --name vault [yourname]/vault
```

### Using Vault
I will not document how to use Vault, since very good documentation is provided
by Hashicorp on the Vault website.
[This](https://www.vaultproject.io/docs/concepts/index.html) is a good starting
point.

### Contributing
Contributions are always welcome! Just file an
[issue](https://github.com/bjwschaap/docker-vault/issues) on Github and create
a pull request.

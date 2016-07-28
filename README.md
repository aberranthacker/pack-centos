# pack-centos
Шаблон для [Packer](https://www.packer.io/), который создает
[Vagrant](https://www.vagrantup.com/) коробки при помощи [Fodoj/app-rails.cookbook](https://github.com/Fodoj/app-rails.cookbookhttps://github.com/Fodoj/app-rails.cookbook) используя chef-zero

## Зависимости
Для сборки необходимы: [Packer](https://www.packer.io/downloads.html),
[ChefDK](https://downloads.chef.io/chef-dk/),
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) и
[QEmu](http://wiki.qemu.org/Download)

## Использование
В репозитории два шаблона:
- `base.json` для создания образа VM с установленной CentOS 7.2
- `app.json` использует артифакты создынные с помощью предыдущего шаблона, настраивает VM с помощью Chef и создает Vagrant коробку.

Также в репозитории два скрипта:
- `build-base.sh` запускает Packer с шаблоном `base.json`
- `build-app.sh` загружает app-rails.cookbook, запускает Berk чтоб подтянуть зависимости и запускает Packer с шаблоном `app.json`


runlist задается в `app.json`, по умолчанию
```json
  "run_list": [ "role[dev]" ]
```
роль dev задает атрибут `node['app-rails']['name'] = 'mkdev'` и выполняет `recipe[app-rails::base]`

После успешного завершения на выходе получам две коробки `packer_qemu_libvirt.box` и `packer_virtualbox-iso_virtualbox.box`

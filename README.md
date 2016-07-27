# pack-centos
Шаблон для Packer, который создает Vagrant коробки при помощи [Fodoj/app-rails.cookbook](https://github.com/Fodoj/app-rails.cookbookhttps://github.com/Fodoj/app-rails.cookbook) используя chef-zero

## Зависимости
Для сборки необходимы: Packer, ChefDK, VirtualBox и QEmu

## Использование
```bash
$ git clone https://github.com/olegtc/pack-centos.git
$ cd pack-centos
$ ./build.sh
```
runlist задается в `centos7-template.json`, по умолчанию
```json
  "run_list": [ "role[dev]" ]
```
где приложению присваивается имя `mkdev` и выполняется `recipe[app-rails::base]`

После успешного завершения на выходе получам две коробки `packer_qemu_libvirt.box` и `packer_virtualbox-iso_virtualbox.box`

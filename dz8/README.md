# Работа с загрузчиком
  - система была загружена без пароля двумя способами - через изменение параметров загрузки (снимки экрана 1_1_1.jpg - 1_1_4.jpg) и черезе recovery mode (снимки экрана 1_2_1.jpg - 1_2_3.jpg)
  - изменение имени vg lvm проводилось в режиме загрузки recovery mode, результат на снимках экрана 2_1.jpg - 2_3.jpg
  - ввиду отсутсвия в ubuntu по умолчанию dracut, а также с целью проверки отличного от примера метода, использовался вариант с выполнением скрипта посредством initramfs-tools; скрипт размещался по пути /etc/initramfs-tools/scripts/init-premount/ с последующим обновлением initrd, результа выполения в процессе закгрузки ОС приведен на снимке экрана 3.jpg

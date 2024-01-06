# systemd - работа с unit-файлами
  - запуск службы watchlog осуществляется командой: systemctl start watchlog.timer; файлы конфигурации и результат работы службы приведены в файле watchlog-typescript
  - установка пакетов для apache и spawn-fcgi: apt-get update && apt-get install spawn-fcgi apache2  php php-cgi php-cli libapache2-mod-fcgid
  - запуск службы spawn-fcgi осуществляется командой: systemctl start spawn-fcgi; файлы конфигурации и результат работы службы приведены в файле spawn-fcgi-typescript
  - в Ubuntu уже имеется возможность запуск параллельно нескольких инстаносов apache с различными файлами конфигурации
  - создание дополнительных инстансов apache осуществлялось командой: sh /usr/share/doc/apache2/examples/setup-instance _имя_инстанса_; пример: sh /usr/share/doc/apache2/examples/setup-instance first; далее проводилось редактирование файлов конфигурации для использования выделенного порта
  - запуск инстансов apache осуществлялся командами: systemctl start apache2@first.service и systemctl start apache2@second.service
  - файлы конфигурации и статус работы службы apache приведены в файле apache-typescript

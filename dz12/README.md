# Работа с SELinux
Ввиду нативной поддержки SELinux в Ubuntu при выполнении заданий использвалась CentOS
  1. Запуск nginx на нестандартном порту:
     - использование setsebool - 1_1-typescript
     - добавление порта в имеющийся тип - 1_2-typescript
     - формирование и установка модуля SELinux - 1_3-typescript
  2. Обеспечение работы приложения (DNS) при включенном SELinux:
    - результаты выполнения команд на стороне сервера ns01 приведены в файле ns01-typescript
    - снимок экрана с результатами выполеннения команд на стороне клиента приведен в файле client.jpg
    - причина проблемы работы DNS в том, что для контекста безопасности демона named отсутствует доступ к файлам с типом etc_t, который задан для файлов зоны DNS
    - возможные варианты решения проблемы:
       - разршить доступ к файлом с типом etc_t, но это даст избыточные полномочия в виде доступа к большому списку файлов
       - перенести файлы зон DNS с изменением типов в каталог по умолчанию /var/named, для которого уже заданы необходимые полномочия
       - изменить для файлов зон в каталоге /etc/named тип на такой, к которому у named уже есть доступ; реализован данный вариант
    - для постоянного изменения контекста файлов зон необходимо воспользоваться командой semanage fcontext, иначе при восстановлении контекста проблема повторится вновь
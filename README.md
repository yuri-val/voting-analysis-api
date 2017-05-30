# Завдання DEV Challenge 11
## Створити WebAPI на основі набору pdf-файлів.
### Деталі завдання:
Є набір даних про голосування депутатів в незручній для автоматичної обробки формі (pdf файли),
повний список файлів - [за посиланням](https://drive.google.com/file/d/0B5_FQ3NcRoptYS1jX1pXcG4wcUE/view?usp=sharing). Створений вами додаток має здійснити парсинг,
конвертувати у зручний формат (база даних).
Необхідно також реалізувати наступні задачі:
1. Розробити відкрите API для отримання результатів голосувань.
2. Додатковою перевагою буде реалізація пошуку серед обмеженого набору депутатів (їх 37)
"зон впливу", тобто аналіз того, які групи найбільш часто голосують однаково (між собою)
або які групи найбільш близькі і далекі від центру впливу (центр впливу - той чи інший
депутат, задається як параметр), щоб зрозуміти які люди найчастіше голосують однаково.
Зверніть увагу, що список депутатів може дещо змінюватись, адже деякі депутати можуть складати
мандат і їх замінюють інші.
Система має бути готовою коректно обробляти появу нових файлів.

# README

### Run with docker:
    

    docker-compose build
    docker-compose run web rake db:drop db:create db:migrate
    docker-compose run web rake example:make default_data:load parser:run
    docker-compose up


If you need, you may use not PG DB. Just rename file `database.yml.mysql_example`
or `database.yml.sqlite_example` to `database.yml`.
Also you have to change db parameters for MySQL and PG in `database.yml`.

### Direct run (ruby >= 2.3.x):
    

    bundle install
    rake db:drop db:create db:migrate
    rake example:make default_data:load parser:run
    rails s


Go to root application url (`127.0.0.1:3000`) for more info about routes.

If you want to load new pdf-files to application put them into `public/pdfs`
and run `rake parser:run`

Routes:
  - `/v1/deputies/{:id}` -- list of all deputies in db or deputy by {:id}
  - `/v1/votings/{:id}` -- list of all votings (headers in pdf-file above the table)

Nested routes:
  - `/v1/votings/:voting_id/voting_rows/{:id}` -- voting table of voting by voting_id
  - `/v1/deputies/:deputy_id/votings/` -- all votings filtered by deputy
  - `/v1/deputies/:deputy_id/zones` -- Zones of influence of deputy

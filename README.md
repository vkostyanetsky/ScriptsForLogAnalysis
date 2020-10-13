# Скрипты для анализа логов платформы

 [![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

- [Топ исключений](/ExceptionsTop). Выводит тысячу наиболее частотных ошибок в формате «количество срабатываний + описание». Пример настройки ТЖ — в файле [logcfg.xml](/ExceptionsTop/logcfg.xml).
- [Уникальные GUID'ы](/UniqueGUIDs). Выводит перечень уникальных GUID'ов из файла [test.log](/UniqueGUIDs/test.log) в той же директории (это лог тестирования и исправления из конфигуратора).
- [Уязвимости](/Vulnerabilities). Ищет в файлах конфигурации айпишники, ссылки, e-mail'ы и роли с правом на интерактивное удаление чего-либо.
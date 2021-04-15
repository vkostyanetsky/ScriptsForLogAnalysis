# Топ событий ТЖ.
#
# Выводит события технологического журнала (от наиболее частотного к наименее частотному). Для каждого
# события выводится количество воспроизведений.
#
# Большого практического смысла скрипт не имеет, но может использоваться для получения общей картины
# или как болванка для других, более специфических задач.
#

cat */*.log | 

# Удаляем из потока данных UTF-8 BOM.
#
perl -pe 's/\xef\xbb\xbf//g' |

# Теперь нам нужно найти все имена событий и определить, сколько раз каждое событие происходит. Используем gawk. 
#
# Установим настройки. Во-первых, запись каждого события в файле ТЖ начинается с его времени и продолжительности
# (например, 14:55.636001-1). Сделаем такую подстроку разделитем записей (ключ -vRS). Теперь каждая запись будет
# содержать текст события полностью (информация, переводы строк, другие спецсимвы — в общем, всё, кроме времени
# события и его продолжительности).
# 
# Во-вторых, имя события — если оно есть — помещается в строке события первым (так как все до него мы сделали разделителем
# строк). Если сделать запятую разделителем полей (ключ -F), то первое же поле будет указывать на имя события.
#
# Скрипт работает в два этапа. На первом мы коллекционируем уникальные имена событий и считаем, сколько раз каждое событие
# было зафиксировано. На втором — для каждого найденного уникального события выводим количество совпадений и имя события.
#
gawk -F',' -vRS='[0-9]+:[0-9]+.[0-9]+-[0-9]+,' '
{  
    EventCounters[$1] += 1;
};

END {
    for (EventName in EventCounters)
        print EventCounters[EventName] " " EventName
}' |
    
# Сортируем события по частотности и выводим результат в файл.
#
sort -rn > FrequentEvents.txt
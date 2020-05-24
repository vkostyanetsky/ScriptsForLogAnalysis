# Поиск идентификаторов в строке. Опция -o заставит egrep вывести только то, что отвечает регулярке.
#
cat sample.log | egrep -o "[1-9]+:[a-z0-9]+" |

# Удаление дублей, способ 1: каждый GUID передается в ассоциативный массив как ключ элемента.
#
# awk '{guids[$1]}END{for (guid in guids) print guid}' > UniqueGUIDs.txt

# Удаление дублей, способ 2: сортировка строк и выборка уникальных.
#
sort | uniq > UniqueGUIDs.txt
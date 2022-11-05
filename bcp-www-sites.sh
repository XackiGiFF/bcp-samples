#!/usr/bin/bash
DIR=/var/www/www-root/data/www #Путь к сайтам
DATETIME=$(date +%F_%R)
clear
mkdir -p $DIR/BCP/$DATETIME/
echo "[Резервное копирование] "$DATETIME" Запускаю бекап сайта SIMPLE1.RU"
echo "[Резервное копирование] "$DATETIME" Текущее состояние дисков:"
df -h
sleep 1



echo "[Резервное копирование] "$DATETIME" Запускаю резервное копирование данных сайта SIMPLE1.RU (0/2)"

cd $DIR/inavto47.ru/
tar cf - . -P | pv -s $(du -sb ./ | awk '{print $1}') | gzip -9 - > $DIR/BCP/$DATETIME/"BCP_www_simple1.ru_."$DATETIME.tar.gz
clear
echo "[Резервное копирование] "$DATETIME" WWW Бекап для сайта SIMPLE1.RU успешно создан!(1/2)"
sleep 1
clear
echo "[Резервное копирование] "$DATETIME" Запускаю бекап базы данных сайта SIMPLE1.RU (1/2)"
mysqldump -v --no-tablespaces -usait -p{passwordhere} sait | gzip -9 - > $DIR/BCP/$DATETIME/"BCP_mysql_simpe1.ru_."$DATETIME.sql.gz
sleep 1
clear
echo "[Резервное копирование] "$DATETIME" MYQSL Бекап базы данных сайта SIMPLE1.RU успешно создан!(2/2)"
sleep 1
echo "[Резервное копирование] "$DATETIME" MYSQL и WWW сайта SIMPLE1.RU Успешно созданы!"
sleep 1
clear

#
# - Условный разделитель
#

echo "[Резервное копирование] "$DATETIME" Запускаю бекап сайта SIMPLE2.SHOP"
echo "[Резервное копирование] "$DATETIME" Текущее состояние дисков:"
df -h

sleep 1



echo "[Резервное копирование] "$DATETIME" Запускаю резервное копирование данных сайта SIMPLE2.SHOP (0/2)"

cd $DIR/ruavto.shop/
tar cf - . -P | pv -s $(du -sb ./ | awk '{print $1}') | gzip -9 - > $DIR/BCP/$DATETIME/"BCP_www_simple2.shop_.$(date +%F_%R)".tar.gz
clear
echo "[Резервное копирование] "$DATETIME" WWW Бекап для сайта SIMPLE2.SHOP успешно создан!(1/2)"
sleep 1
clear
echo "[Резервное копирование] "$DATETIME" Запускаю бекап базы данных сайта SIMPLE2.SHOP (1/2)"

mysqldump -v --no-tablespaces -usait -p{passwordhere} ruavto | gzip -9 - > $DIR/BCP/$DATETIME/"BCP_mysql_simple2.shop_.$(date +%F_%R)".sql.gz
sleep 1
clear
echo "[Резервное копирование] "$DATETIME" MYQSL Бекап базы данных сайта SIMPLE2.SHOP успешно создан!(2/2)"
sleep 1
echo "[Резервное копирование] "$DATETIME" MYSQL и WWW сайта SIMPLE2.SHOP Успешно созданы!"
sleep 1
clear
echo "[Резервное копирование] "$DATETIME" MYSQL и WWW для сайтов SIMPLE1.RU  и SIMPLE2.SHOP Успешно созданы!"
sleep 5



ls -l $DIR/BCP/$DATE


#!/bin/bash


HTML_FILE="/var/www/html/index.html"
HEADER_COLOR="#C0392B"  
DATA_COLOR="#2980B9"    




TARIH=$(date "+%d.%m.%Y %H:%M:%S")


CPU_LOAD=$(uptime | rev | cut -d: -f1 | rev | cut -d, -f2 | tr -d ' ')


RAM_TOTAL=$(free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 2)
RAM_USED=$(free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 3)


DISK_INFO=$(df -h / | grep /)
DISK_SIZE=$(echo "$DISK_INFO" | tr -s ' ' | cut -d ' ' -f 2)
DISK_USED_PERCENT=$(echo "$DISK_INFO" | tr -s ' ' | cut -d ' ' -f 5)


AKTIF_KULLANICI=$(whoami | wc -l)



echo "<!DOCTYPE html>
<html lang='tr'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='refresh' content='60'> 
    <title>Linux Sunucu Durum Paneli</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 40px; background-color: #F8F9F9; }
        .container { max-width: 800px; margin: auto; background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        h1 { color: $HEADER_COLOR; border-bottom: 3px solid $DATA_COLOR; padding-bottom: 10px; margin-top: 0; }
        .data-row { display: flex; justify-content: space-between; padding: 12px 0; border-bottom: 1px dotted #ccc; }
        .label { font-weight: bold; color: $HEADER_COLOR; width: 50%; }
        .value { color: $DATA_COLOR; text-align: right; width: 50%; }
    </style>
</head>
<body>
<div class='container'>
    <h1>Sunucu Durum Paneli</h1>" > $HTML_FILE

echo "
    <div class='data-row'><span class='label'>Raporun Oluşturulma Saati:</span> <span class='value'>$TARIH</span></div>
    <div class='data-row'><span class='label'>CPU Yük Ortalaması (1 Dk):</span> <span class='value'>$CPU_LOAD</span></div>
    <div class='data-row'><span class='label'>Toplam RAM:</span> <span class='value'>${RAM_TOTAL} MB</span></div>
    <div class='data-row'><span class='label'>Kullanılan RAM:</span> <span class='value'>${RAM_USED} MB</span></div>
    <div class='data-row'><span class='label'>Disk Toplam Boyut:</span> <span class='value'>$DISK_SIZE</span></div>
    <div class='data-row'><span class='label'>Disk Doluluk Oranı:</span> <span class='value'>$DISK_USED_PERCENT</span></div>
    <div class='data-row'><span class='label'>Aktif Kullanıcı Sayısı:</span> <span class='value'>$AKTIF_KULLANICI</span></div>" >> $HTML_FILE

echo "
    <p style='margin-top: 25px; text-align: center; color: #777;'>Otomasyon (Cronjob) ile her dakika güncellenir.</p>
</div>
</body>
</html>" >> $HTML_FILE

echo "index.html dosyası başarıyla güncellendi."
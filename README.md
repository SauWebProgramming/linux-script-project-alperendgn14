[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/g9rN3dhc)

Merhabalar, ben Sakarya Üniversitesi Bilişim Sistemleri Müh. bölümünden b241200010 numaralı Muhammet Alperen Doğan. 

1) Projenin tanıtımı
   > Amacımız, basit bir linux scripti ile sistem istatistiklerini bir html sayfasına yazdıran bir script oluşturmak.


2) Monitor.sh'da kullandığım kodlar.
   > Tarihi date komutunu %d.%m.%Y% %H:%M:%S ile formatlayarak çektim.
   
   > Cpu yükünün hesabını ise şu şekilde hesapladım : uptime ile sistemin ne kadar açık olduğunu ve yük ortalamasını aldım, sonrasında
     rev ile metni ters çevirdim, cut -d: -f1 ile metni böldüm ilk parçayı aldım, rev ile tekrar eski haline çevirdim, cut -d, -f2 ile
     son 1 dakikalık yükü çektim, tr -d ' ' ile de gereksiz boşlukları sildim.
 
   > RAM durumunun hesabını iki değişkenle (RAM_TOTAL ve RAM_USED) ile yaptım.
      RAM_TOTAL = free -m ile bellek kullanımını MB cinsinden aldım, grep Mem: ile sadece ram kısmını aldım, tr -s ' ' ile tek boşluğa             indirdim, cut -d ' ' -f 2 ile toplam ram'i, cut -d ' ' -f 3 ile kullanılanı aldım.

   > Disk alanını da aynı ram gibi hesapladım (DISK_SIZE ve DISK_USED_PERCENT)
     df -h / ile kök dizini seçtim, grep / ile sadece veri olan satırı seçtim, echo "$DISK_INFO" toplanan bilgiyi işlem yapmak üzere sisteme      döndürdüm,  cut -d ' ' -f 2 ile total boyutu aldım, cut -d ' ' -f 5 doluluk oranını % ile temsil eden kısmı aldım.
   
   > Aktif kullanıcı hesabı
     who ile giriş yapmış kullanıcıları listeledim, wc -l ile count'unu aldım.

3) Kullandığım paketler
  > Nginx ve crontab kullanıldı.

4) Crontab setupu
   > Crontab -e ile düzenleyiciyi açtım, en alta "* * * * * /bin/bash /home/alperen/monitor.sh" yazdım. Yıldızlı kısım sayesinde dakikada bir, bin bash kısmı ile bashte çalıştıracağını ve sonrasında da hangi scripti çalıştıracağını belirttim. 
 
     

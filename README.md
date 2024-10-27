# Projeyi ayağa kaldırmak için

php artisan migrate

php artisan serve --host=localhost --port=8000 

php artisan schedule:work

komutlarını yazmak yeterlidir. 


Eğer bir sorun çıkarsa, https://github.com/Alivahap/CoinFeed/blob/main/database/coinfeed.sql dosyası import edilebilinir.




### 1 dakikada bir veri çekmek istiyorsanız aşağıdaki komutu kullanabilirsiniz.
php artisan schedule:work

### tek seferde veri çekmek istiyorsanız aşağıdaki komutu kullanabilirsiniz.
php artisan fetch:crypto-news

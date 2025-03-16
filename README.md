# cloudlfared auto update

setelah download file tersebut 

Beri izin eksekusi:
- chmod +x update_cloudflared.sh

Jalankan script:
- ./update_cloudflared.sh


kita jadikan auto-update setiap 2 minggu menggunakan cron job.

1. Edit Crontab

Jalankan perintah ini untuk mengedit crontab:

crontab -e

Jika pertama kali membuka crontab, pilih editor (misalnya nano).

2. Tambahkan Jadwal Auto-Update

Di dalam crontab, tambahkan baris berikut:

0 3 */14 * * /bin/bash /root/update_cloudflared.sh >> /var/log/cloudflared_update.log 2>&1

Penjelasan:
	•	0 3 */14 * * → Setiap 14 hari (2 minggu) pada pukul 03:00 pagi
	•	/bin/bash /root/update_cloudflared.sh → Menjalankan script update
	•	>> /var/log/cloudflared_update.log 2>&1 → Menyimpan output ke log di /var/log/cloudflared_update.log

3. Simpan dan Keluar

Jika menggunakan nano, tekan:
	•	CTRL + X → Y → Enter

Lalu jalankan perintah ini untuk memastikan cron aktif:

crontab -l

Seharusnya muncul baris yang sudah kita tambahkan.

4. Cek Log Update

Setelah 2 minggu atau setelah manual dijalankan:

cat /var/log/cloudflared_update.log

Sekarang Cloudflared akan otomatis update setiap 2 minggu! Jika ingin update manual, cukup jalankan:

/root/update_cloudflared.sh

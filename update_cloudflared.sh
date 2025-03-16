#!/bin/bash

# Nama file sementara untuk package
CLOUDFLARED_DEB="/tmp/cloudflared.deb"

# URL terbaru untuk cloudflared (paket .deb)
LATEST_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb"

# Unduh paket terbaru
echo "Mengunduh Cloudflared dari: $LATEST_URL"
curl -L --output "$CLOUDFLARED_DEB" "$LATEST_URL"

# Cek apakah file berhasil diunduh
if [[ ! -f "$CLOUDFLARED_DEB" || ! -s "$CLOUDFLARED_DEB" ]]; then
    echo "Gagal mengunduh Cloudflared! File tidak valid."
    exit 1
fi

# Hentikan Cloudflared sebelum update
echo "Menghentikan layanan Cloudflared..."
systemctl stop cloudflared

# Install paket
echo "Menginstal Cloudflared..."
dpkg -i "$CLOUDFLARED_DEB"

# Hapus file deb setelah instalasi
rm -f "$CLOUDFLARED_DEB"

# Jalankan kembali layanan
echo "Memulai ulang Cloudflared..."
systemctl start cloudflared

# Tampilkan versi terbaru
cloudflared --version

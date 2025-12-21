# 📝 Panduan Edit Website YouTube Studio Assistant

## 🌐 Live Preview URL
**Website Development:** https://8080-ig3xya8ixr0u0qt6mtkof-6e8347c4.manusvm.computer

> ⚠️ **Catatan:** URL ini temporary dan hanya untuk development. Perubahan akan otomatis terlihat setelah refresh browser.

---

## 📂 Struktur File

```
youtube-studio-assistant/
├── index.html          # File HTML utama (website Anda)
├── assets/            # CSS, JavaScript, dan asset lainnya
├── images/            # Semua gambar dan favicon
├── favicon.ico        # Icon website
└── CNAME              # Domain configuration
```

---

## ✏️ Cara Edit Halaman

### **Opsi 1: Edit di GitHub (Mudah)**

1. Buka https://github.com/hoybeecreativs/youtube-studio-assistant
2. Klik file `index.html`
3. Klik tombol **Edit** (ikon pensil di kanan atas)
4. Edit konten yang diinginkan
5. Scroll ke bawah, isi commit message
6. Klik **Commit changes**
7. Tunggu 1-2 menit, website otomatis update

### **Opsi 2: Edit di Sandbox (Advanced)**

1. Edit file menggunakan command atau text editor
2. Refresh browser untuk melihat perubahan
3. Push ke GitHub setelah selesai

---

## 🔧 Cara Menambah Menu Baru

Website Anda menggunakan **React** yang sudah di-compile ke dalam `index.html`. Untuk menambah menu:

### **Langkah 1: Identifikasi Lokasi Menu**

Menu biasanya ada di bagian **Header/Navigation**. Cari di `index.html` bagian yang berisi:
- `<nav>` tag
- `<header>` tag  
- Class seperti `menu`, `navigation`, `navbar`

### **Langkah 2: Tambahkan Item Menu Baru**

Contoh struktur menu (cari pattern serupa di index.html):

```html
<nav class="menu">
  <a href="#home">Home</a>
  <a href="#features">Features</a>
  <a href="#pricing">Pricing</a>
  <!-- TAMBAHKAN MENU BARU DI SINI -->
  <a href="#about">About</a>
  <a href="#contact">Contact</a>
</nav>
```

### **Langkah 3: Buat Section/Halaman Baru**

Tambahkan section baru di body:

```html
<section id="about" class="section">
  <div class="container">
    <h2>About Us</h2>
    <p>Konten tentang aplikasi Anda...</p>
  </div>
</section>
```

---

## 🎨 Cara Mengubah Konten

### **1. Mengubah Teks**
Cari teks yang ingin diubah di `index.html` dan edit langsung.

### **2. Mengubah Gambar**
1. Upload gambar baru ke folder `images/`
2. Ubah path di HTML: `<img src="/images/nama-gambar-baru.png">`

### **3. Mengubah Warna/Style**
- CSS ada di folder `assets/` atau inline di `index.html`
- Cari class atau style yang ingin diubah

---

## 🚀 Cara Push Perubahan ke GitHub

```bash
cd /home/ubuntu/youtube-studio-assistant
git add .
git commit -m "Deskripsi perubahan Anda"
git push origin main
```

Setelah push, website akan otomatis update dalam 1-2 menit.

---

## 💡 Tips

1. **Selalu backup** sebelum edit besar
2. **Test di local** dulu sebelum push
3. **Commit sering** dengan message yang jelas
4. **Gunakan browser DevTools** (F12) untuk inspect element

---

## 📞 Butuh Bantuan?

Jika ada kesulitan, saya siap membantu! Beritahu saya:
- Menu apa yang ingin ditambahkan?
- Konten apa yang ingin diubah?
- Fitur apa yang ingin ditambahkan?

---

**Happy Coding! 🎉**

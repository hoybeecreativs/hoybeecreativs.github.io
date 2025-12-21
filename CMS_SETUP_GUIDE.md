# 🎨 Decap CMS Setup Guide - YouTube Studio Assistant

## ✅ Status Setup

Decap CMS telah berhasil di-install dan dikonfigurasi untuk website Anda!

---

## 🔐 Setup Authentication (Diperlukan untuk Akses CMS)

Untuk mengakses CMS, Anda perlu setup OAuth dengan salah satu metode berikut:

### **Metode 1: Menggunakan Netlify (Recommended - Paling Mudah)** ⭐

1. **Buat Akun Netlify (Gratis)**
   - Kunjungi https://app.netlify.com/signup
   - Sign up dengan akun GitHub Anda

2. **Import Repository**
   - Klik "Add new site" → "Import an existing project"
   - Pilih "GitHub" dan authorize Netlify
   - Pilih repository: `hoybeecreativs/youtube-studio-assistant`
   - Branch: `main`
   - Build command: (kosongkan)
   - Publish directory: `/`
   - Klik "Deploy site"

3. **Enable Identity & Git Gateway**
   - Setelah site deployed, buka "Site settings"
   - Klik "Identity" di sidebar
   - Klik "Enable Identity"
   - Scroll ke bawah, klik "Enable Git Gateway"
   - Di "Registration preferences", pilih "Invite only" atau "Open"

4. **Akses CMS**
   - Buka: `https://youtubestudioassistant.website/admin/`
   - Login dengan GitHub
   - Mulai edit website!

---

### **Metode 2: GitHub OAuth (Manual - Lebih Advanced)**

1. **Buat GitHub OAuth App**
   - Buka https://github.com/settings/developers
   - Klik "New OAuth App"
   - Application name: `YouTube Studio Assistant CMS`
   - Homepage URL: `https://youtubestudioassistant.website`
   - Authorization callback URL: `https://api.netlify.com/auth/done`
   - Klik "Register application"

2. **Setup OAuth Server**
   - Deploy OAuth server (bisa pakai Netlify Functions atau Vercel)
   - Configure dengan Client ID dan Client Secret dari GitHub

3. **Update config.yml**
   - Update `base_url` dan `auth_endpoint` di `/admin/config.yml`

---

### **Metode 3: Local Development (Untuk Testing)**

Untuk testing di local tanpa OAuth:

1. Install Decap CMS Proxy
   ```bash
   npx decap-server
   ```

2. Update `config.yml`, uncomment:
   ```yaml
   local_backend: true
   ```

3. Akses CMS di `http://localhost:8080/admin/`

---

## 📂 Struktur CMS

Setelah setup, Anda bisa edit:

### **1. Pages**
- **Home Page**: Edit hero section, heading, description, CTA buttons

### **2. Site Settings**
- **Navigation**: Tambah/edit menu items
- **General Settings**: Site title, description, logo

### **3. Features**
- Tambah/edit/hapus feature cards
- Upload icon untuk setiap feature
- Atur urutan tampilan

### **4. Pricing Plans**
- Tambah/edit pricing plans
- Set featured plan
- Edit features list

### **5. FAQ**
- Tambah/edit FAQ items
- Atur urutan

---

## 🌐 Cara Akses CMS

Setelah setup authentication:

**URL Admin Panel:**  
https://youtubestudioassistant.website/admin/

**Login dengan:** GitHub account Anda

---

## 🎯 Cara Menggunakan CMS

1. **Login** ke admin panel
2. **Pilih collection** yang ingin diedit (Pages, Features, Pricing, dll)
3. **Edit content** dengan visual editor
4. **Save** - otomatis commit ke GitHub
5. **Publish** - website otomatis update dalam 1-2 menit

---

## 💡 Tips

- ✅ Semua perubahan otomatis tersimpan di GitHub
- ✅ Ada version history (bisa rollback)
- ✅ Bisa upload gambar langsung dari CMS
- ✅ Preview sebelum publish
- ✅ Markdown editor untuk konten panjang

---

## 🚀 Next Steps

1. **Pilih metode authentication** (Netlify recommended)
2. **Setup OAuth** sesuai panduan di atas
3. **Login ke CMS** dan mulai edit!
4. **Customize** sesuai kebutuhan

---

## 📞 Butuh Bantuan?

Jika ada kesulitan dalam setup, beritahu saya:
- Metode authentication mana yang Anda pilih?
- Ada error message?
- Butuh bantuan setup Netlify?

Saya siap membantu! 😊

---

**Happy Editing! 🎉**

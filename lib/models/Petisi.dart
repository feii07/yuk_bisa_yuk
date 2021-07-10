import 'package:flutter/material.dart';

class Petisi {
  String judul, deskripsi, gambar;
  int id, target, terkumpul, populer;
  //kalau sudah lebih jauh, array bisa dijadikan model User
  List<String> partisipan = [];
  
  Petisi({
    required this.judul,
    required this.deskripsi,
    required this.gambar,
    required this.id,
    required this.target,
    required this.terkumpul,
    required this.populer,
    required this.partisipan,
  });
}

var petisiList = [
  Petisi(
    id: 1,
    judul: 'Ambyar! Patung Didi Kempot akan dibangun di Stasiun Solo Balapan',
    deskripsi: 'Hari ini, tanggal 5 Mei 2020, seorang legenda musik pop telah berpulang, yaitu Didi Kempot. Kepergian beliau tentu sangat mengagetkan, mengingat dua minggu yang lalu beliau melakukan konser amal dengan Kompas TV dan mengumpulkan dana miliaran rupiah untuk disalurkan kepada tim medis yang menangangi COVID-19. Karya beliau juga akhir-akhir ini mampu menembus batas generasi, dengan fakta bahwa setiap shownya selalu dipenuhi anak muda yang berjoget, menangisi dan mentertawakan rasa patah hatinya. Semua kesuksesan mainstream beliau dimulai sejak rilisnya single "Stasiun Balapan" di tahun 1998. Beliau mulai dikenal di luar Jawa, bahkan hingga Suriname. ',
    gambar: 'assets/images/petisi1.jpg',
    target: 5,
    terkumpul: 0,
    populer: 1,
    partisipan: [],
  ),
  Petisi(
    id: 2,
    judul: 'Desakan Pembukaan Segel Makam Sunda Wiwitan; Stop Diskriminasi Minoritas',
    deskripsi: 'Presiden Joko Widodo, Segera Penuhi Hak-hak Masyarakat Adat Sunda Wiwitan untuk Membangun Bakal Pemakaman dan Menindak Tegas Bupati Kuningan yang Berupaya Menghancurkan Warisan Budaya Nusantara. Telah terjadi upaya pemusnahan salah satu budaya asli Indonesia. Pada 20 Juli 2020 lalu, Satpol PP menyegel bakal makam sesepuh AKUR Sunda Wiwitan, salah satu kepercayaan tertua di Indonesia.',
    gambar: 'assets/images/petisi2.jpg',
    target: 5,
    terkumpul: 0,
    populer: 1,
    partisipan: [],
  ),
  Petisi(
    id: 3,
    judul: '@KapalApi_ID Jelaskan Keaslian dan Penggunaan Mahkota Cendrawasih dalam Iklan',
    deskripsi: 'Kalian sudah lihat iklan Kapal Api yang baru? Iklan ini mempertontonkan beberapa aktor dan aktris yang menggunakan pakaian adat dari penjuru nusantara. Ada rasa bangga yang ikut timbul di sa punya hati Tapi rasa bangga itu berubah menjadi sedih saat sa lihat salah satu model iklan tersebut menggunakan Mahkota Cendrawasih, yang terlihat asli. ',
    gambar: 'assets/images/petisi3.jpg',
    target: 5,
    terkumpul: 0,
    populer: 0,
    partisipan: [],
  ),
  Petisi(
    id: 4,
    judul: 'HAPUSKAN UJIAN NASIONAL',
    deskripsi: 'Dear Kementrian Pendidikan dan Budaya RI, kami bukan manja atau cengeng atau pemalas, kami juga bukan bodoh. Kami juga sebenarnya tidak peduli ada corona atau tidak, sebenarnya sejak awal kami ingin UN dihapuskan (Corona salah satu trigger untuk menyuarakan pendapat). UN jujur hanya menjadi TEKANAN bagi siswa dan TIDAK membawa faedah bagi kami. KELULUSAN kami memiliki persentase paling tinggi di Ujian Sekolah, lantas apa kegunaan kami melakukan UN? UN hanya sekedar jadi formalitas untuk melanjutkan tradisi-tradusu pendidikan kuno yang tidak selaras dengan perkembangan pendidikan saat ini, kita hidup di zaman mana SKILL jauh lebih dihargai daripada nilai UN. Kami tidak meminta banyak, setelah kami masuk sekolah karena liburan Corona, kami minta UN langsung dihapuskan, kami setiap hari belajar mati-matian dengan pelajaran yang kami tidak paham angka dan katanya. ',
    gambar: 'assets/images/petisi4.jpg',
    target: 5,
    terkumpul: 0,
    populer: 0,
    partisipan: [],
  ),
  Petisi(
    id: 5,
    judul: 'Jangan penjarakan Kakek Sapur yang hanya petani kecil!',
    deskripsi: 'Lagi-lagi petani lansia jadi korban ketidakadilan. Sebelumnya ada Kakek Syafrudin di Pekanbaru yang terancam penjara. Namun setelah didukung 10.506 orang lewat petisi, akhirnya ia bisa bebas. Kali ini menimpa Kakek Saprudin dari desa Juking Panjang, Kabupaten Murung Raya Kalimantan Tengah. Kakek yang biasa dipanggil Sapur itu dituntut Jaksa PN Muara Taweh karena dituduh jadi penyebab kebakaran hutan. ',
    gambar: 'assets/images/petisi5.jpg',
    target: 5,
    terkumpul: 0,
    populer: 0,
    partisipan: [],
  ),
    Petisi(
    id: 6,
    judul: 'Stop Siksa dan Makan Kucing di Pasar Tomohon',
    deskripsi: 'Petisi ini di buat perihal untuk aksi Pembantaian kucing Dari Pasar Tomohon, SULUT  Di dalam video itu terlihat sangat Jelas, kucing disiksa dengan cara di di cekik ,di pukul dan dibakar hidup-hidup untuk di Makan . Kebiasaan ini sudah terjadi sudah lama belum ada tindakan apapun, kami pencinta Hewan ( Cat Lovers) melihat ini semua sangat miris atas kekejaman ini. ',
    gambar: 'assets/images/petisi6.jpg',
    target: 5,
    terkumpul: 0,
    populer: 0,
    partisipan: [],
  ),
    Petisi(
    id: 7,
    judul: 'Gratiskan Rapid Test Covid-19 untuk Peserta UTBK 2021!',
    deskripsi: 'Rencana banyak calon mahasiswa untuk kuliah bisa gagal. Tahun ini, peserta Ujian Tulis Berbasis Komputer (UTBK) diharuskan bayar rapid test Rp150-250 ribu. Padahal nggak semua orang mampu. Untuk bayar biaya pendaftarannya aja sebetulnya banyak yang kesulitan. Ini malah harus ditambah biaya rapid test. Kami bukannya menolak melakukan tes rapid, namun tidak semua keluarga mampu membayar tambahan biaya tersebut.  ',
    gambar: 'assets/images/petisi7.jpg',
    target: 5,
    terkumpul: 0,
    populer: 1,
    partisipan: [],
  ),
];
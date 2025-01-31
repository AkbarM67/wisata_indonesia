class Wisata {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String gambar;

  Wisata({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.gambar,
  });
}

List<Wisata> wisataList = [
  Wisata(
    nama: "Raja Ampat",
    lokasi: "Papua Barat",
    deskripsi: "Raja Ampat terkenal dengan keindahan lautnya yang luar biasa.",
    gambar: "assets/images/Raja_Ampat.jpg",
  ),
  Wisata(
    nama: "Borobudur",
    lokasi: "Jawa Tengah",
    deskripsi: "Candi Buddha terbesar di dunia, penuh dengan sejarah.",
    gambar: "assets/images/borobudur.jpg",
  ),
  Wisata(
    nama: "Gunung Bromo",
    lokasi: "Jawa Timur",
    deskripsi: "Gunung berapi aktif dengan pemandangan sunrise yang menakjubkan.",
    gambar: "assets/images/Gunung_Bromo.jpeg",
  ),
];

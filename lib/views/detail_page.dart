import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_indonesia/models/model_wisata.dart';
import '../providers/wisata_provider.dart';

class DetailPage extends StatelessWidget {
  final Wisata wisata;

  DetailPage({required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Consumer<WisataProvider>(
            builder: (context, wisataProvider, child) {
              final isSaved = wisataProvider.isSaved(wisata);
              return IconButton(
                icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
                onPressed: () => wisataProvider.toggleSave(wisata),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(wisata.gambar, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    wisata.lokasi,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    wisata.deskripsi,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

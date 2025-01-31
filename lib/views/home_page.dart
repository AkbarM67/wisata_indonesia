import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_indonesia/models/model_wisata.dart';
import '../providers/wisata_provider.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Indonesia"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Semua Wisata"),
            Tab(text: "Tersimpan"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWisataList(wisataList),
          Consumer<WisataProvider>(
            builder: (context, wisataProvider, child) {
              return _buildWisataList(wisataProvider.savedWisata);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWisataList(List<Wisata> wisataList) {
    return ListView.builder(
      itemCount: wisataList.length,
      itemBuilder: (context, index) {
        final wisata = wisataList[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Image.asset(wisata.gambar, width: 100, fit: BoxFit.cover),
            title: Text(wisata.nama, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(wisata.lokasi),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(wisata: wisata),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

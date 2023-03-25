import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Diseases"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        //scrollDirection: Axis.horizontal,
        itemCount: listDisease.length,
        itemBuilder: (BuildContext context, int index) {
          final Diseases diseases = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HalamanDetail(
                          disease: diseases, diseases: diseases)));
            },
            child: Card(
              elevation: 10, //shadow
              child: Container(
                //ukuran card
                height: MediaQuery.of(context).size.height / 4,
                width: 300,
                padding: const EdgeInsets.all(12),

                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          //ini ukuran foto
                          height: 400,
                          width: 150,
                          child: Image.network(diseases.imgUrls)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //biar bertingkat diberi column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          diseases.name,
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

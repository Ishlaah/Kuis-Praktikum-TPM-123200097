import 'package:flutter/material.dart';
import 'disease_data.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases disease;
  const HalamanDetail(
      {Key? key, required this.disease, required Diseases diseases})
      : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.disease.name),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: (isFavorite)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.disease.imgUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(widget.disease.imgUrls),
                        );
                      },
                      pageSnapping: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '${widget.disease.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Disease Name   : ' + widget.disease.name),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                            'Plant Name       : ' + widget.disease.plantName),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Ciri-ciri             : ' +
                            widget.disease.nutshell.toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child:
                            Text('Disease ID         : ' + widget.disease.id),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                            'Sympton          : ' + widget.disease.symptom),
                      ),
                    ],
                  ),
                ),
              ],
            ))));
  }
}

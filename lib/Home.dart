import 'package:flutter/material.dart';

import 'Profile.dart';
import 'VideoDetail.dart';

//Breaking layouts in Rows and Columns in Flutter – Flutter Community – Medium
//https://medium.com/flutter-community/breaking-layouts-in-rows-and-columns-in-flutter-8ea1ce4c1316

class Home extends StatelessWidget {

  Container leftSection(String img) {
    return new Container(
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(img),
        backgroundColor: Colors.lightGreen,
        radius: 24.0,
      ),
    );
  }
  Expanded middleSection(String img) {
    return new Expanded(
      child: new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              img,
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            new Text(
              img,
              style: new TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
  final rightSection = new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text(
          "9:50",
          style: new TextStyle(color: Colors.lightGreen, fontSize: 12.0),
        ),
        new CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 10.0,
          child: new Text(
            "2",
            style: new TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        )
      ],
    ),
  );

  final listavideoRetos = List<ListaVideo>.generate(
    5,
        (i) => ListaVideo(
        i,
        'Ejemplo de reto $i',
        'Ejemplo descripción $i',
        'http://placehold.it/500x300&text=image$i', null),


  );
  @override
  Widget build(BuildContext context) {
 
    final listavideo = List<ListaVideo>.generate(
      20,
          (i) => ListaVideo(
          i,
          '$i Cuanto COBRO en YOUTUBE por 1 MILLON DE VISITAS en 2019 | Demostrado en video ',
          'A description of what needs to be done for Todo $i',
          'http://grupohbtravel.com/imagenes/G/29032019111259.jpg',
          listavideoRetos),

    );
    return Scaffold(
      // appBar:  AppBar(
      //   title: Text('First Route')
      // ),
        body:   ListView.builder(
            itemCount: listavideo.length,
            itemBuilder: (context, index) {
              // Image.network('http://grupohbtravel.com/Imagenes/G/2014526164446.JPG'),
              return new GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return Videodetail(
                            listavideo: listavideo[index],
                            listavideoAux: listavideo,

                          );
                        },
                        // fullscreenDialog: true,
                      )),
                  child: (
                      //  ListView(
                      //   scrollDirection: Axis.vertical,
                      // children: <Widget>[
                      Container(
                        //height: 200,
                        //child: Card(
                        // child: Wrap(
                        //padding: new EdgeInsets.all(8.0),
                        //height: 250.0,
                        child: new Column(
                          children: <Widget>[
                            new Center(
                              child: new AspectRatio(
                                aspectRatio: 600 / 250,
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        alignment: FractionalOffset.topCenter,
                                        image: new NetworkImage(
                                            'http://grupohbtravel.com/imagenes/G/29032019111259.jpg'),
                                      )),
                                ),
                              ),
                            ),
                            new Row(
                              children: <Widget>[
                                leftSection(
                                    'http://grupohbtravel.com/imagenes/G/29032019111259.jpg'),
                                middleSection(listavideo[index].title),
                                rightSection
                              ],
                            )
                          ],
                        ),
                      )

                      //  )
                      // ],
                  ));
            })

      // ListView.builder(
      //       itemCount: listavideo.length,
      //       itemBuilder: (context, index){
      //           return ListTile( title: Text(listavideo[index].title));
      //         },
      //       )

    );
  }
}

class ListaVideo {
  final int id;
  final String title;
  final String description;
  final String image;
  final List<ListaVideo> listavideoRetos;
  //final List<ListaVideo> listaVideoAux;
  ListaVideo(this.id ,this.title, this.description, this.image, this.listavideoRetos);
}

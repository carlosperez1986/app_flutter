//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

//https://github.com/fleepgeek/flutter-youtube-ui/blob/master/lib/screens/video_detail.dart

//1.- primero se crea una clase de tipo statefulwidget, con su constructor y los parametro que se necesitan//
class Videodetail extends StatefulWidget {
  Videodetail(
      {Key key, @required this.listavideo, this.listavideoAux, this.title, this.listavideoRetos})
      : super(key: key);

  @override
  Videodetailstate createState() =>
      Videodetailstate(this.listavideo, this.listavideoAux, this.title);

  final ListaVideo listavideo;
  final List<ListaVideo> listavideoAux;
  final String title;
  final listavideoRetos;

}

//2.- luego se crea otra clase de tipo state para usar setstate con las variables que necesiten//
class Videodetailstate extends State<Videodetail> {
  ListaVideo listavideo;
  List<ListaVideo> listavideoAux;
  String title;
  int _page;
  //List<ListaVideo> listavideoRetos = (List<ListaVideo>)listavideo.listavideoRetos;

  Videodetailstate(this.listavideo, this.listavideoAux, this.title);

  //obligatorio en clase de tipo state
  @override
  void initState() {
    listavideo = this.listavideo;
    listavideoAux = this.listavideoAux;
    title = listavideo.title;
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() => _page = page);
    title = listavideoAux[_page].title;
    //listavideoAux[_page].currentState.onPageVisible();
  }


  @override
  Widget build(BuildContext context) {
    if (listavideo.image != null) {
      Center(child: Image.network(listavideo.image));
    }

    //var list = querySnapshot.;
    Future<List<String>> getFavorites() async {
       QuerySnapshot querySnapshot =
           (await Firestore.instance.collection('videos').getDocuments());
       var l = querySnapshot.documents;
      // // if (querySnapshot.exists &&
      // //     querySnapshot.data.containsKey('title') &&
      // //     querySnapshot.data['title'] is List) {
      // //   // Create a new List<String> from List<dynamic>
      // //   return List<String>.from(querySnapshot.data['title']);
      // // }
       l.forEach((x) {
         print(x.data);
         //print(x.data["-title"]);
       });
    
       return [];
    }

    var xx = getFavorites();

    // var firestore =  Firestore;
    //   Future<QuerySnapshot> favoritesReference =
    //       (await firestore.instance.collection('videos').getDocuments()
    //     .catchError((error) {
    //   print('Error: $error');
    //   return false;
    // });;
    //  var f = FirebaseAnimatedList
    //  (
    //  query: FirebaseDatabase.instance.reference().child('videos'),
    //  itemBuilder: (context, snapshot, animation, index) {
    //    return Row(children: <Widget>[
    //      Text(
    //        snapshot.value['title'],
    //        style: TextStyle(fontSize: 13.0),
    //      ),
    //    ]);
    //  }
    //  );
    Future<void> _neverSatisfied(String img) async {
      final screenSize = MediaQuery.of(context).size;
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return Center(
            //contentPadding: EdgeInsets.all(0),

            // title: Text('Rewind and remember'),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Image.network(img),
                      // Text('You\’re like me. I’m never satisfied.'),
                    ],
                  ),
                ),
              ],
            ),
            // actions: <Widget>[
            //   FlatButton(
            //     child: Text('Regret'),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        },
      );
    }

    Widget _buildButtonColumn(IconData icon, String text) {
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Icon(
              icon,
              color: Colors.grey[700],
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      );
    }

    double xGesture = 0;
    /////// ///////
    Widget _channelInfo() {
      return Container(
        
        decoration: BoxDecoration(
          border: Border(
            // top: BorderSide(color: Colors.grey, width: 0.5),
            bottom: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child:
        Padding( padding: EdgeInsets.all(20), child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listavideo.image),
                ),
                title: Text(
                  'canal info',
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text("15,000 subscribers"),
              ),
            ),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_filled,
                  color: Colors.red,
                ),
                label: Text(
                  "SUBSCRIBE",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),) 
      );
    }

    var channelInfo = _channelInfo();



    Widget _item(ListaVideo listavideo) {
      return Container(
        child: ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(0),
              child: new Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      _neverSatisfied(listavideo.image);
                    },
                    child: new Padding(
                      padding: EdgeInsets.all(0),
                      child: new Column(
                        children: <Widget>[Image.network(listavideo.image)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Column(
              children: <Widget>[
                ListTile(
                  // leading: const Icon(Icons.event_seat),
                  title: Text(listavideo.title),
                  subtitle: Text(listavideo.description),
                ),
                //f,
                //likes
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black12)),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 7, left: 40.0, right: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildButtonColumn(Icons.thumb_up, '12'),
                            _buildButtonColumn(Icons.thumb_down, '2'),
                            _buildButtonColumn(Icons.share, "Share"),
                            _buildButtonColumn(
                                Icons.cloud_download, "Download"),
                            _buildButtonColumn(Icons.playlist_add, "Save"),
                          ],
                        )),
                  ),
                ),
                Column(
                  children: <Widget>[channelInfo],
                ),
                Column(children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: listavideo.listavideoRetos.length,
                    itemBuilder: (context, index) {
                      return
                        new Column( children: <Widget>[
                          Image.network(listavideo.listavideoRetos[index].image),
                          ListTile(
                            title: Text( listavideo.listavideoRetos[index].title),
                            onTap: () {
                              //Go to the next screen with Navigator.push
                            },
                          )
                        ]);

                    },

                    //         return new GestureDetector(
                    // onTap: () => Navigator.push(
                    //     context1,
                    //     MaterialPageRoute<Null>(
                    //       builder: (BuildContext context2) {
                    //         return Videodetail(
                    //           listavideo: listavideoRetos[index],
                    //           //listavideoAux: listavideo,

                    //         );
                    //       },
                    //      // fullscreenDialog: true,
                    //     )),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Center(
                    //     child: ( new Container(

                    //       child: Text("data"),
                    //     )),
                    //     ),
                    //   ),
                    // );
                    // },

                  ),
                ],)
              ],
            )
          ],
        ),
        //),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: new RefreshIndicator(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
            onRefresh: () {
              Future.delayed(new Duration(seconds: 3));
            },
            // aqui le paso la lista de videos con la paginacion //
            child: new PageView.builder(
              key: Key(listavideo.id.toString()),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              onPageChanged: (x) => {_onPageChanged(x)},
              controller: PageController(initialPage: listavideo.id),
              itemBuilder: (context, position) => _item(
                  listavideoAux[position == 0 ? listavideo.id : position]),
              itemCount: listavideoAux.length,
            )));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wellness_wave/Models/news_model.dart';
import 'package:wellness_wave/Models/news_view_model.dart';
import 'package:wellness_wave/UiScreens/news_details.dart';


class ScreenNews extends StatefulWidget {
  const ScreenNews({super.key});

  @override
  State<ScreenNews> createState() => _ScreenNewsState();
}

class _ScreenNewsState extends State<ScreenNews> {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat("MMMM dd- yy ");
  String categoryName = 'health';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCategoriesNewsApi(categoryName),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        color: Colors.indigoAccent,
                        size: 40,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return InkWell(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailsScreen(
                                  newsImage: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  newsTitle: snapshot
                                      .data!.articles![index].title
                                      .toString(),
                                  newsDate: snapshot
                                      .data!.articles![index].publishedAt
                                      .toString(),
                                  author: snapshot
                                      .data!.articles![index].author
                                      .toString(),
                                  description: snapshot
                                      .data!.articles![index].description
                                      .toString(),
                                  content: snapshot
                                      .data!.articles![index].content
                                      .toString(),
                                  source: snapshot
                                      .data!.articles![index].source!.name
                                      .toString())));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      height: height * 0.18,
                                      width: width * 0.3,
                                      placeholder: (context, url) => Container(
                                        child: spinkit2,
                                      ),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          color: Colors.redAccent),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        height: height * 0.18,
                                        padding: EdgeInsets.only(left: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              snapshot.data!.articles![index].title
                                                  .toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!.articles![index]
                                                      .source!.name
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  format.format(dateTime),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final spinkit2 = const SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );
}

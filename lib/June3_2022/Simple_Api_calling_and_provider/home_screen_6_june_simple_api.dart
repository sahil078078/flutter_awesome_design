import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/June3_2022/Simple_Api_calling_and_provider/provider_getdata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen6JuneSimpleAPICalling extends StatefulWidget {
  const HomeScreen6JuneSimpleAPICalling({Key? key}) : super(key: key);

  @override
  State<HomeScreen6JuneSimpleAPICalling> createState() =>
      _HomeScreen6JuneSimpleAPICallingState();
}

class _HomeScreen6JuneSimpleAPICallingState
    extends State<HomeScreen6JuneSimpleAPICalling> {
  @override
  void initState() {
    super.initState();
    final postData = Provider.of<ProviderForGetData>(context, listen: false);
    postData.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<ProviderForGetData>(context);
    final indexSelectProvider = Provider.of<SelectCategoryIndex>(context);

    // for watching and reflect change
    context.watch<SelectCategoryIndex>();

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'API Fetch',
          style: GoogleFonts.poppins(
            color: Colors.black38,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: postData.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        postData.modalClass.data.length,
                        (index) => GestureDetector(
                          onTap: () {
                            indexSelectProvider.getCategoryIndex(index: index);
                            log(indexSelectProvider.selectCategoryIndex
                                .toString());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffe0857f),
                                  Color(0xffeabbbc),
                                ],
                              ),
                              border: Border.all(
                                color: index ==
                                        indexSelectProvider.selectCategoryIndex
                                    ? Colors.black
                                    : Colors.black12,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                postData.modalClass.data
                                    .elementAt(index)
                                    .category
                                    .name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: postData.modalClass.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 8,
                                top: 10,
                              ),
                              padding: const EdgeInsets.only(
                                top: 15,
                                left: 20,
                                right: 10,
                                bottom: 15,
                              ),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      indexSelectProvider.selectCategoryIndex ==
                                              index
                                          ? Colors.black
                                          : Colors.black12,
                                  width: 0.65,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(postData.modalClass.data
                                      .elementAt(index)
                                      .title),
                                  Text(
                                      'name : ${postData.modalClass.data.elementAt(index).category.name}'),
                                  Text(
                                      'desc : ${postData.modalClass.data.elementAt(index).description}'),
                                  Text(
                                      'price : ${postData.modalClass.data.elementAt(index).price}'),
                                  Text(
                                      'CreatorBy : ${postData.modalClass.data.elementAt(index).createdBy.name}'),
                                  Text(
                                      'slug : ${postData.modalClass.data.elementAt(index).category.slug}'),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

/*

FutureBuilder<ModalClass>(
        future: fetchData3june1(),
        builder: (context, AsyncSnapshot<ModalClass> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.data[index].createdBy.id);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
 */

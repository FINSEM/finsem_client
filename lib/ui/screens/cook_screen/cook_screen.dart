import 'package:finsem_client/controller/api_helper.dart';
import 'package:finsem_client/model/cook_model.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';

class CookScreen extends StatefulWidget {
  const CookScreen({Key? key}) : super(key: key);

  @override
  State<CookScreen> createState() => _CookScreenState();
}

class _CookScreenState extends State<CookScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Find a cook',
      isBack: true,
      child: FutureBuilder<List<Cook>>(
          future: ApiHelper.fetchCook(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, ind) {
                  return ListTile(
                    title: Text(snapshot.data![ind].name),
                  );
                });
          }),
    );
  }
}

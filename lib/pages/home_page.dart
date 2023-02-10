import 'package:check_in_out/blocs/check_in_out_bloc.dart';
import 'package:check_in_out/models/model.dart';
import 'package:check_in_out/resources/api.dart';
import 'package:flutter/material.dart';
import 'list_check_in_out.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllCheckInOut();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Giờ Hoàng Đạo"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: bloc.allCheckInOut,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListCheckInOut(list: snapshot.data!);
                  }
                  return const Center(child: Text('Không thể tải dữ liệu'));
                },
              ),
            ),
          ],
        )));
  }
}

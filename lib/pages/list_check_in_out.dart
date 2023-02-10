import 'package:check_in_out/blocs/check_in_out_bloc.dart';
import 'package:check_in_out/models/model.dart';
import 'package:check_in_out/resources/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';

import '../utils/constance.dart';
import '../utils/noti_bar.dart';

class ListCheckInOut extends StatefulWidget {
  const ListCheckInOut({super.key, required this.list});
  final List<CheckInOutModel> list;

  @override
  State<ListCheckInOut> createState() => _ListCheckInOutState();
}

class _ListCheckInOutState extends State<ListCheckInOut> {
  bool isUpdate = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.list.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: 60,
                      child: Card(
                        elevation: 8,
                        shadowColor: const Color(0xff2da9ef),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            returnDate(widget.list[index].timeStr!),
                          ),
                          trailing: Text(
                            returnTime(widget.list[index].timeStr!),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            : const Center(child: Text('Không thể tải dữ liệu')),
        ElevatedButton(
          onPressed: () async {
            Loader.show(context,
                progressIndicator: const CircularProgressIndicator());
            var checkResult = await CheckInOutAPI().update();
            print(checkResult);
            if (checkResult.contains('"success":true')) {
              Loader.hide();
              // ignore: use_build_context_synchronously
              NotiBar.showSnackBar(
                context,
                'Thêm giờ hoàng đạo thành công!',
                status: NotificationStatusEnum.success,
              );
            } else {
              Loader.hide();
              // ignore: use_build_context_synchronously
              NotiBar.showSnackBar(
                context,
                'Đã xảy lỗi trong quá trình xử lý!',
                status: NotificationStatusEnum.error,
              );
            }
            bloc.fetchAllCheckInOut();
          },
          child: const Text('Check In/ Check Out'),
        )
      ],
    );
  }

  String returnDate(String str) {
    final datetime = DateTime.parse(str);
    String formattedDate = DateFormat('dd/MM/yyyy').format(datetime);
    return formattedDate;
  }

  String returnTime(String str) {
    final datetime = DateTime.parse(str);
    String formattedDate = DateFormat('HH:mm:ss').format(datetime);
    return formattedDate;
  }
}

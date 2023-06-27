
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:provider/provider.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('isTimeOut  :${mainBloc.mainModel.isTimeOut.toString()}'),
            Text('isError    :${mainBloc.mainModel.isError.toString()}'),
            Text('isErrorType:${mainBloc.mainModel.e.runtimeType}'),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  mainBloc.getAllProducts(page: 0);
                },
                child: const Text('Try again')),
          ],
        ));
  }
}
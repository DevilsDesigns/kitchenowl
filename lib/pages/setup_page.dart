import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchenowl/cubits/auth_cubit.dart';
import 'package:kitchenowl/kitchenowl.dart';

class SetupPage extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context).setupTitle),
              TextField(
                controller: urlController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.url,
                onSubmitted: (text) => BlocProvider.of<AuthCubit>(context)
                    .setupServer(urlController.text),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).address,
                  hintText: 'https://localhost:5000',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: ElevatedButton(
                  onPressed: () => BlocProvider.of<AuthCubit>(context)
                      .setupServer(urlController.text),
                  child: Text(AppLocalizations.of(context).go),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

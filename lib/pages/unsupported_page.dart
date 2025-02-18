import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchenowl/cubits/auth_cubit.dart';
import 'package:kitchenowl/kitchenowl.dart';

class UnsupportedPage extends StatelessWidget {
  final bool unsupportedBackend;

  const UnsupportedPage({Key? key, required this.unsupportedBackend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\\:',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 10),
              Text(
                unsupportedBackend
                    ? AppLocalizations.of(context)!.unsupportedBackendMessage
                    : AppLocalizations.of(context)!.unsupportedFrontendMessage,
                maxLines: null,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: BlocProvider.of<AuthCubit>(context).refresh,
                child: Text(AppLocalizations.of(context)!.refresh),
              ),
              if (!kIsWeb) Text(AppLocalizations.of(context)!.or),
              if (!kIsWeb)
                TextButton(
                  onPressed: () =>
                      BlocProvider.of<AuthCubit>(context).removeServer(),
                  child: Text(AppLocalizations.of(context)!.serverChange),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

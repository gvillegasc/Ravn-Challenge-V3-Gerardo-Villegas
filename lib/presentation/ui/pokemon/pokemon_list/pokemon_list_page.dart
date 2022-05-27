import 'dart:async';

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokechallenge/injection/injection.dart';
import 'package:pokechallenge/presentation/blocs/internet_connection/internet_connection_bloc.dart';
import 'package:pokechallenge/presentation/blocs/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/widgets/pokemon_list.dart';
import 'package:pokechallenge/presentation/ui/pokemon/pokemon_list/widgets/pokemon_list_app_bar.dart';
import 'package:pokechallenge/presentation/ui/widgets/alert_internet_disconnected.dart';
import 'package:pokechallenge/presentation/ui/widgets/container_disconnected.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late StreamSubscription<DataConnectionStatus> _internetConnectionListener;

  @override
  void initState() {
    super.initState();
    _loadConnectionListener();
  }

  @override
  void dispose() {
    super.dispose();
    _internetConnectionListener.cancel();
  }

  void _loadConnectionListener() {
    _internetConnectionListener =
        DataConnectionChecker().onStatusChange.listen((status) {
      final bloc = context.read<InternetConnectionBloc>();
      switch (status) {
        case DataConnectionStatus.connected:
          bloc.add(const OnConnectionStatus(DataConnectionStatus.connected));
          break;
        case DataConnectionStatus.disconnected:
          bloc.add(const OnConnectionStatus(DataConnectionStatus.disconnected));
          alertInternetDisconnected(context, () {
            _internetConnectionListener.cancel();
            Navigator.pop(context);
            _loadConnectionListener();
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PokemonListBloc>(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, a) {
              return [
                const PokemonListAppBar(),
              ];
            },
            body: BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
              builder: (context, state) {
                if (state is InternetDisconnected) {
                  return const ContainerDisconnected();
                }
                return const PokemonList();
              },
            ),
          ),
        ),
      ),
    );
  }
}

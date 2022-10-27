import 'package:flutter/material.dart';
import 'package:flutter_full_learn_vb/202/image_learn_202.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/service/reqres_service.dart';
import 'package:flutter_full_learn_vb/303/reqres_resourse/viewModel/req_res_provider.dart';
import 'package:flutter_full_learn_vb/product/extension/string_extension.dart';
import 'package:flutter_full_learn_vb/product/global/theme_notifer.dart';
import 'package:flutter_full_learn_vb/product/service/project_dio_mixin.dart';
import 'package:provider/provider.dart';

import '../../../product/global/resoruce_context.dart';
import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(dioService)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : null,
            actions: const [_SaveAndNavigate()],
          ),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(child: _resouceListview(context, context.watch<ReqresProvider>().resouces)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifer>().chanceTheme();
            },
            child: const Icon(Icons.change_circle_outlined),
          ),
        );
      },
    );
  }

  ListView _resouceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(items[index].name ?? ""),
        );
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ReqresProvider>().saveToLocale(context.read<ResourceContext>());
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ImageLearn202()));
      },
      icon: const Icon(Icons.save_alt_outlined),
    );
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (contex, provider) {
      return provider.isLoading;
    });
  }
}

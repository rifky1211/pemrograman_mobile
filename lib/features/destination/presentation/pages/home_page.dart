import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemrograman_mobile/features/destination/presentation/bloc/input/input_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final edtSearch = TextEditingController();

  search() {
    if (edtSearch.text == '') return;
    context.read<InputBloc>().add(OnInput(edtSearch.text));
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 80,
              ),
              child: buildSearch(),
            ),
            Container(
              child: BlocBuilder<InputBloc, InputState>(
                builder: (context, state) {
                  if (state is InputLoaded) {
                    return result(int.parse(state.data));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            'Tugas Sesi 4',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Rifky Ardiansyah (20180801357)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Unit Konversi Satuan Kilometer',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: edtSearch,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Input text here...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton.filledTonal(
                onPressed: () => search(),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  result(int data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Result',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 10)} hm',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 100)} dam',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 1000)} m',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 10000)} dm',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 100000)} cm',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${NumberFormat.decimalPatternDigits().format(data * 1000000)} mm',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}



import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_binding.dart';
import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_page.dart';
import 'package:flutter_ujikom_test_2/feature/home/home_binding.dart';
import 'package:flutter_ujikom_test_2/feature/home/home_page.dart';
import 'package:flutter_ujikom_test_2/feature/informasi/informasi_binding.dart';
import 'package:flutter_ujikom_test_2/feature/informasi/informasi_page.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_berita/lihat_berita_binding.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_berita/lihat_berita_page.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/detail_data/detail_data_page.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/detail_data/update_data.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/lihat_data_binding.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/lihat_data_page.dart';
import 'package:flutter_ujikom_test_2/feature/loader/loading_page.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageName.FORMENTRY,
      page: () => FormEntryPage(),
      binding: FormEntryBinding(),
    ),
    GetPage(
      name: PageName.LIHATDATA,
      page: () => LihatDataPage(),
      binding: LihatDataBinding(),
    ),
    GetPage(
      name: PageName.DETAILDATA,
      page: () => DetailDataPage(),
    ),
    GetPage(
      name: PageName.UPDATEDATA,
      page: () => UpdateDataPage(),
    ),
    GetPage(
      name: PageName.INFORMATION, 
      page: () => InformationPage(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: PageName.BERITA, 
      page: () => LihatBeritaPage(),
      binding: LihatBeritaBinding(),
    ),
    GetPage(
      name: PageName.LOADER,
      page: () => const LoadingPage(),
    ),
  ];
}

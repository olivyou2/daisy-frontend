import 'package:daisy_frontend/page/register/states/registerStates.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/label.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const data = {
  "서울시": [
    "강남구",
    "강동구",
    "강북구",
    "강서구",
    "관악구",
    "광진구",
    "구로구",
    "금천구",
    "노원구",
    "도봉구",
    "동대문구",
    "동작구",
    "마포구",
    "서대문구",
    "서초구",
    "성동구",
    "성북구",
    "송파구",
    "양천구",
    "영등포구",
    "용산구",
    "은평구",
    "종로구",
    "중구",
    "중랑구",
  ],
  "인천시": [
    "강화군",
    "옹진군",
    "중구",
    "동구",
    "미추홀구",
    "연수구",
    "남동구",
    "부평구",
    "계양구",
    "서구",
  ],
  "경기도": [
    "수원시",
    "용인시",
    "성남시",
    "부천시",
    "화성시",
    "안산시",
    "안양시",
    "평택시",
    "시흥시",
    "김포시",
    "광주시",
    "광명시",
    "군포시",
    "하남시",
    "오산시",
    "이천시",
    "안성시",
    "의왕시",
    "양평군",
    "여주시",
    "과천시",
    "고양시",
    "남양주시",
    "파주시",
    "의정부시",
    "양주시",
    "구리시",
    "포천시",
    "동두천시",
    "가평군",
    "연천군",
  ],
  "강원도": [
    "춘천시",
    "원주시",
    "강릉시",
    "동해시",
    "태백시",
    "속초시",
    "삼척시",
    "홍천군",
    "횡성군",
    "영월군",
    "평창군",
    "정선군",
    "철원군",
    "화천군",
    "양구군",
    "인제군",
    "고성군",
    "양양군",
  ],
  "충청남도": [
    "천안시",
    "공주시",
    "보령시",
    "아산시",
    "서산시",
    "논산시",
    "계룡시",
    "당진시",
    "금산군",
    "부여군",
    "서천군",
    "청양군",
    "홍성군",
    "예산군",
    "태안군",
  ],
  "충청북도": [
    "청주시",
    "상당구",
    "서원구",
    "흥덕구",
    "청원구",
    "충주시",
    "제천시",
    "보은군",
    "옥천군",
    "영동군",
    "증평군",
    "진천군",
    "괴산군",
    "음성군",
    "단양군",
  ],
  "전라남도": [
    "목포시",
    "여수시",
    "순천시",
    "나주시",
    "광양시",
    "담양군",
    "곡성군",
    "구례군",
    "고흥군",
    "보성군",
    "화순군",
    "장흥군",
    "강진군",
    "해남군",
    "염암군",
    "무안군",
    "함평군",
    "영광군",
    "장성군",
    "완도군",
    "진도군",
    "신안군",
  ],
  "전라북도": [
    "전주시",
    "익산시",
    "군산시",
    "정읍시",
    "김제시",
    "남원시",
    "완주군",
    "고창군",
    "부안군",
    "임실군",
    "순창군",
    "진안군",
    "무주군",
    "장수군",
  ],
  "제주도": [
    "제주시",
    "서귀포시",
    "한경면",
    "안덕면",
    "표선면",
    "한립읍",
    "애월읍",
    "조천읍",
    "구좌읍",
    "선산읍",
    "남원읍",
    "대정읍",
  ],
};

class LocationPicker extends ConsumerStatefulWidget {
  const LocationPicker({super.key});

  @override
  ConsumerState<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends ConsumerState<LocationPicker> {
  String _state = '';
  String _city = '';

  showPickerModal(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter(
          data: [
            PickerItem(
              text: const Text("서울시"),
              value: "서울시",
              children: List.generate(
                data["서울시"]!.length,
                (index) => PickerItem(
                  text: Text(data["서울시"]![index]),
                  value: data["서울시"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("인천시"),
              value: "인천시",
              children: List.generate(
                data["인천시"]!.length,
                (index) => PickerItem(
                  text: Text(data["인천시"]![index]),
                  value: data["인천시"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("경기도"),
              value: "경기도",
              children: List.generate(
                data["경기도"]!.length,
                (index) => PickerItem(
                  text: Text(data["경기도"]![index]),
                  value: data["경기도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("강원도"),
              value: "강원도",
              children: List.generate(
                data["강원도"]!.length,
                (index) => PickerItem(
                  text: Text(data["강원도"]![index]),
                  value: data["강원도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("충청남도"),
              value: "충청남도",
              children: List.generate(
                data["충청남도"]!.length,
                (index) => PickerItem(
                  text: Text(data["충청남도"]![index]),
                  value: data["충청남도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("충청북도"),
              value: "충청북도",
              children: List.generate(
                data["충청북도"]!.length,
                (index) => PickerItem(
                  text: Text(data["충청북도"]![index]),
                  value: data["충청북도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("전라남도"),
              value: "전라남도",
              children: List.generate(
                data["전라남도"]!.length,
                (index) => PickerItem(
                  text: Text(data["전라남도"]![index]),
                  value: data["전라남도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("전라북도"),
              value: "전라북도",
              children: List.generate(
                data["전라북도"]!.length,
                (index) => PickerItem(
                  text: Text(data["전라북도"]![index]),
                  value: data["전라북도"]![index],
                ),
              ),
            ),
            PickerItem(
              text: const Text("제주도"),
              value: "제주도",
              children: List.generate(
                data["제주도"]!.length,
                (index) => PickerItem(
                  text: Text(data["제주도"]![index]),
                  value: data["제주도"]![index],
                ),
              ),
            ),
          ],
        ),
        changeToFirst: true,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          String result = picker.adapter.text.replaceAll(RegExp(r'\[|\]'), '');
          setState(() {
            _state = result.split(', ')[0];
            _city = result.split(', ')[1];

            getRegisterStateProvider(ref).updateLocation(result);
          });
        }).showModal(context); //_scaffoldKey.currentState);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Label(text: '거주지', required: true),
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorPalette.gray3),
            ),
          ),
          child: TextButton(
            onPressed: () => showPickerModal(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _city.isNotEmpty && _state.isNotEmpty
                      ? '$_state $_city'
                      : '거주지를 선택해주세요',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorPalette.gray3,
                      fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(
                  'assets/svgs/arrow_down.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

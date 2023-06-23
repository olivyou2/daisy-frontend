import 'package:daisy_frontend/recommand/widgets/molecule/body.dart';
import 'package:daisy_frontend/recommand/widgets/molecule/appbar.dart';
import 'package:daisy_frontend/recommand/widgets/molecule/footer.dart';
import 'package:flutter/material.dart';

class RecommandScreen extends StatelessWidget {
  const RecommandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 560,
            toolbarHeight: 160,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Appbar(
                subtitle: '김땡땡님에게 추천하는 데이트코스',
                description:
                    '국립현대미술관에서 전시하는 \'MMCA 현대차 시리즈 2022: 최우람 - 작은 방주\'관람하고 안국역 구석구석 다녀보아요',
                title: '요즘 핫한 전시와 함께하는 안국역 데이트',
              ),
              titlePadding: EdgeInsets.all(0),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
              child: Body(
            listTitle: '안국 데이트코스',
          )),
          SliverToBoxAdapter(
            child: Footer(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatelessWidget {
  WalkthroughScreen({Key? key, required this.route}) : super(key: key);
  final String route;
  
  final _controller = PageController();

  _onSkipPressed(context) {
    pushNamed(context, route);
  }

  _onNextPressed(context) {
    if (_controller.page! >= (_list.length - 1).toDouble()) {
      return _onSkipPressed(context);
    }
    _controller.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _list,
      ),
      bottomSheet: SizedBox(
          height: 72,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: const Text(skip),
                onPressed: () => _onSkipPressed(context),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: _list.length,
              ),
              TextButton(
                child: const Text(next),
                onPressed: () => _onNextPressed(context),
              ),
            ],
          )),
    );
  }
}

const _list = <WalkthroughItem>[
  WalkthroughItem(
    asset: 'assets/images/walkthrough1.png',
    title: 'Mobilidade na sua mão!',
    desc:
        'O Buzzão facilita a vida de quem usa o transporte coletivo, descomplicando compra de créditos, consultas e muito mais!\nVamos conhecer o aplicativo?',
  ),
  WalkthroughItem(
    asset: 'assets/images/walkthrough2.png',
    title: 'Catraca sem cartão',
    desc:
        'Recarregue créditos avulsos ou para estudantes online através de boleto bancário, cartões ou transferência bancária, ou diretamente nos pontos de venda.',
  ),
  WalkthroughItem(
    asset: 'assets/images/walkthrough3.png',
    title: 'Itinerário, Roteirizador e Informativo',
    desc:
        'Acesse notícias e atualizações recorrentes, horários do transporte coletivo, origens e destinos, pontos de parada, atrasos, desvios e tarifas.',
  ),
  WalkthroughItem(
    asset: 'assets/images/walkthrough4.png',
    title: 'Praticidade que você merece',
    desc:
        'Gostou? Então vamos começar! Agora que você já conhece algumas das incríveis facilidades do aplicativo do Buzzão, falta só completarmos o seu cadastro pra você aproveitar! Vamos lá?',
  )
];

class WalkthroughItem extends StatelessWidget {
  final String asset;
  final String title;
  final String desc;

  const WalkthroughItem({
    Key? key,
    required this.asset,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            desc,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

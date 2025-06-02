import 'package:flutter/material.dart';

class RegulationsContent extends StatelessWidget {
  const RegulationsContent({super.key});

  Text buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
      textAlign: TextAlign.justify,
    );
  }

  Text buildHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading('1. Postanowienia ogólne'),
            buildParagraph(
                '1.1. Sklep internetowy DropCheck dostępny pod adresem https://dropcheck.store prowadzony jest przez osobę fizyczną prowadzącą działalność gospodarczą pod nazwą DropCheck.'),
            buildParagraph(
                '1.2. Regulamin określa zasady korzystania ze sklepu internetowego, w tym składania zamówień, dostawy towarów, płatności oraz odstąpienia od umowy i składania reklamacji.'),
            const SizedBox(height: 20),
            buildHeading('2. Oferta sklepu'),
            buildParagraph(
                '2.1. DropCheck prowadzi sprzedaż detaliczną odzieży, obuwia i akcesoriów modowych za pośrednictwem Internetu.'),
            buildParagraph(
                '2.2. Wszystkie produkty oferowane w sklepie są nowe, oryginalne i zgodne z opisem.'),
            const SizedBox(height: 20),
            buildHeading('3. Składanie zamówień'),
            buildParagraph(
                '3.1. Zamówienia można składać 24/7 przez stronę internetową sklepu.'),
            buildParagraph(
                '3.2. W celu złożenia zamówienia Klient wybiera produkt, rozmiar oraz ilość i dodaje go do koszyka, a następnie uzupełnia dane adresowe i wybiera metodę płatności oraz dostawy.'),
            buildParagraph(
                '3.3. Umowa sprzedaży zostaje zawarta w momencie potwierdzenia zamówienia przez Sklep.'),
            const SizedBox(height: 20),
            buildHeading('4. Płatności'),
            buildParagraph(
                '4.1. Klient ma możliwość dokonania płatności za pomocą: płatności elektronicznych, Google Pay / Apple Pay (jeśli dostępne), oraz innych metod oferowanych przez operatora płatności.'),
            buildParagraph(
                '4.2. Płatność musi zostać zrealizowana w momencie składania zamówienia.'),
            const SizedBox(height: 20),
            buildHeading('5. Dostawa'),
            buildParagraph('5.1. Zamówienia realizowane są na terenie Polski.'),
            buildParagraph(
                '5.2. Przewidywany czas dostawy to 1–5 dni roboczych od zaksięgowania płatności.'),
            buildParagraph(
                '5.3. Koszty dostawy są podawane w trakcie składania zamówienia.'),
            const SizedBox(height: 20),
            buildHeading('6. Odstąpienie od umowy'),
            buildParagraph(
                '6.1. Konsument ma prawo odstąpić od umowy w terminie 14 dni od otrzymania towaru.'),
            buildParagraph(
                '6.2. W celu odstąpienia należy poinformować sklep mailowo: kontakt@dropcheck.store.'),
            buildParagraph(
                '6.3. Produkt należy odesłać w stanie nienaruszonym, najlepiej w oryginalnym opakowaniu.'),
            const SizedBox(height: 20),
            buildHeading('7. Reklamacje'),
            buildParagraph(
                '7.1. W przypadku wady towaru Klient ma prawo do złożenia reklamacji.'),
            buildParagraph(
                '7.2. Reklamacje można składać na adres: reklamacje@dropcheck.store.'),
            buildParagraph('7.3. Sklep odpowie w ciągu 14 dni roboczych.'),
            const SizedBox(height: 20),
            buildHeading('8. Ochrona danych osobowych'),
            buildParagraph(
                '8.1. Administratorem danych osobowych jest właściciel sklepu DropCheck.'),
            buildParagraph(
                '8.2. Dane są przetwarzane wyłącznie w celu realizacji zamówień i – za zgodą – w celach marketingowych.'),
            const SizedBox(height: 20),
            buildHeading('9. Postanowienia końcowe'),
            buildParagraph(
                '9.1. Regulamin dostępny jest na stronie internetowej sklepu.'),
            buildParagraph(
                '9.2. Sklep zastrzega sobie prawo do zmiany regulaminu. Zmiany nie mają wpływu na wcześniejsze zamówienia.'),
            buildParagraph(
                '9.3. W sprawach nieuregulowanych zastosowanie mają przepisy prawa polskiego.'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

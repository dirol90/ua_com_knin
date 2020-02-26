import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ua_com_knin/ui_elements/bottom_search_bar.dart';

class MoreFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0185D4),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text('Еще')),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Html(
              data:
              '<p>Мы осознаем, что информация, которая указывается на данном мобильном приложении &nbsp;knin.com.ua , для некоторых посетителей должна остаться строго под секретом. Поэтому, благодаря данному документу будут расставлены все приоритеты относительного того, какую информацию мы будет использовать, хранить и предоставлять. Выбор о дальнейшем сотрудничестве ложится исключительно на Вас.</p>'
                  '<p><strong>Мобильное приложение&nbsp;</strong></p>'
                  '<p>- Данное мобильное приложения &nbsp;является &nbsp;зеркалом портала &nbsp; http://knin.com.ua &nbsp; и служит удобством для клиентов только для просмотра &nbsp;объявлений и возможность отправить заявку&nbsp;</p>'
                  '<p>- В мобильном приложении авторизация не возможна , только через сайт&nbsp;</p>'
                  ,
              padding: EdgeInsets.all(8.0),
            ),
            Image.asset(
              'assets/im1.png',
            ),
            Html(
              data:
                  '<p><strong>Как публиковать объявления ? </strong></p>'
                  '<p>- Необходимо зарегистрироваться &nbsp;на сайте knin.com.ua и подтвердить почту&nbsp;</p>'
                  '<p>- Пройти авторизацию &nbsp;на сайте и верхнем меню сайта &nbsp;добавить объявление &nbsp;в нужный раздел&nbsp;</p>'
                  '<p>- Публикация объявлений бесплатная без ограничений &nbsp;на количество&nbsp;</p>'
                  '<p>- Жилую недвижимость не публикуем ! Удаляется с публикации при модерации</p>'
                  '<p>- Дубликаты и повторяющие объявления будут удаляться &nbsp;</p>'
                  '<p><strong>Я даю согласие на обработку моих персональных данных (Отправить заявку) &nbsp;</strong></p>'
                  ,
              padding: EdgeInsets.all(8.0),
            ),
            Image.asset(
              'assets/im2.png',
            ),
            Html(
              data:
                  '<p>- Ваши данные &nbsp;могу передаваться нужному получателю по другим источникам это &nbsp;телефон почта viber&nbsp;</p>'
                  '<p>- Мы обрабатываем &nbsp;заявки только по объявлениям с разделов &nbsp;Бизнес Центры \ Бизнес Услуги \ Коворкинг . &nbsp;</p>'
                  '<p>- Мы связываемся с нужным Бизнес Центром и говорим что есть новая заявка и передаем контакты . Так как не все БЦ прошли регистрацию на сайте</p>'
                  '<p>- Для разделов Аренда и Продажа \ Купить бизнес &nbsp; заявки получает напрямую кто опубликовал данное объявление Данные разделы не обрабатываются &nbsp;&nbsp;</p>'
                  '<p>- Ваши контактные данные не будут передаваться третьим лица ( Риелторам и любым рекламным площадкам ) &nbsp;</p>'
                  '<p>- По возможности отправляем ответы о статусе заявке только если телефон использует Viber</p>'
                  '<p><strong>Обратная связь </strong></p>'
                  '<p>Все интересующие вопросы и предложения Вы можете отсылать на адрес:'
                  '<a href="mailto:image2007@bk.ru">image2007@bk.ru </a>'
                  '</p>'
                  '<p>'
                  '<br>'
                  '</p>',
              padding: EdgeInsets.all(8.0),
            ),
          ],
        )),
      ),
      bottomNavigationBar: MyBottomBarSearch(2),
    );
  }
}

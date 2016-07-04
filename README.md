# Учебный центр по созданию децентрализованных автономных организаций на платформе Ethereum
В данном документе содержаться основные учебные уроки по созданию собственной децентрализованной автономной организации (далее сокр. ДАО) (1) с использованием автономных контрактов (2) из репозитория [Aira core](https://github.com/airalab/core).

## Урок 0: подготовьтесь к работе с сетью Ethereum через консоль.
> Уровень сложности урока: низкий.

Вам необходим клиент сети Ethereum, поддерживающий работу в консольном режиме. Рекомендуется использовать клиент сети [geth](https://github.com/ethereum/go-ethereum#automated-development-builds) или [parity](https://ethcore.io/parity.html).

После установки клиента сети необходимо выполнить синхронизацию с **тестовой сетью**. После синхронизации с сетью необходимо добыть крайне небольшую сумму токенов для отправки транзакции, требуемой для выполнения первого урока. Сделать это можно одним из следующих способов:
- **Самый простой способ.** Мы создали [бесплатную раздачу 0,01 эфира на сайте aira.life](http://aira.life/tap/). Необходимо указать адрес аккаунта в тестовой сети и нажать кнопку "Send 0.01 ether". В течении ~ минуты данная сумма будет зачислена на баланс указанного аккаунта.
- **Чтобы познакомитсья с майнингом поближе.** Cледуя [инструкциям в официальной документации Ethereum](http://www.ethdocs.org/en/latest/mining.html#using-geth) включить майнинг в тестовой сети примерно на 20 - 30 минут.
- **Чтобы познакомитсья с Airalab поближе.** Подключиться к каналу команды Airalab в Gitter: [Aira team friends](https://gitter.im/airalab/friends) и написать свой адрес в тестовой сети. Кто нибудь обязательно вам поможет!  

Добыв или получив от команды Airalab немного эфиров для первой транзакции в сеть можно обратиться к контракту Airalab в тестовой сети, который отправит вам в ответ **5 эфиров**, которых будет достаточно для выполнения всех 12 уроков.

### Пример выполнения
- TO DO: Eugene с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-0)

## Урок 1: создайте ядро децентрализованной автономной организации
> Уровень сложности урока: низкий.

**Создаваемые на данном уроке модули ДАО:**
- `DAO core`
- `Shareholder token`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderDAO` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/builder/BuilderCore.json))
- `DAO core` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/Core.json))
- `Shareholder token` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEmission.json))

## Описание урока
Ядро ДАО позволяет хранить реестр всех используемых организацией автономных контрактов. Для управления данным реестром (внесения/изменения/удаления записей) необходимо создать контракт, который будет хранить реестр акционеров организации `Shareholder token`.

Для того, чтобы создать ядро и токен акций необходимо обратиться к фабрике ДАО `DAO factory` отправив транзакцию со своего аккаунта к сборщику ядра `Aira BuilderDAO` следующего формата:

```js
var factory = eth.contract(Core).at("0xa76422591378d14fb6d94c9da48a42498d8b51da")
var builder = eth.contract(BuilderDAO).at(factory.getModule("Aira BuilderDAO"))
builder.create(_dao_name, _dao_description, _shares_name, _shares_symbol, _shares_count,
               {from: eth.accounts[0], gas: 1000000, value: builder.buildingCost()})
```

#### Входные параметры

Параметр | Описание | Пример
---------|----------|-------
`_dao_name` | Название вашей организации | "Martian colony"
`_dao_description` | Краткое описание | "DAO for first human colony on Mars"
`_shares_name` | Название акций | Mars colony shares
`_shares_symbol` | Символ для акций, обычно 1 - 3 символа | MRS
`_shares_count` | Количество акций, эмиссируемых при создании ДАО | 10000

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

Чтобы успешно выполнить данный урок необходимо обратиться к контракту `Lesson 1` для вызова функции `Execute()` указав адрес контракта ядра ДАО `DAO core`.

### Пример выполнения
- TO DO: Eugene с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-1)

## Урок 2: Распределите акции вашей организации
> Уровень сложности урока: низкий.

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Shareholder token` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEmission.json))

## Описание урока
При создании ДАО на баланс адреса создателя `founder` было эмисировано заданное количество акций `Shareholder token`. Теперь время их распределить среди команды.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

Чтобы успешно выполнить данный урок необходимо разрешить снятие  1 акции `Shareholder token` адресу `Airalab learning center` и обратиться к контракту `Lesson 2` для вызова функции `Execute()`.

#### Пример выполнения
- TO DO: Eugene с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-2)

## Урок 3: Используйте общий контракт для хранения эфиров.
> Уровень сложности урока: низкий.

**Создаваемые на данном уроке модули ДАО:**
- `Ether funds`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderTokenEther` ([abi](https://github.com/airalab/core/blob/master/abi/builder/BuilderTokenEther.json)
- `DAO core` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/Core.json))
- `Ether funds` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEther.json))

### Описание урока
Первый шаг к объединению средств организации от акционеров можно выделить в использование общего контракта, на который акционеры передадут средства без учета соотношения вложений к общей сумме средств в эфирах на общем контракте хранения эфиров. Это означает, что все средства, которые будут переведены на контракт будут доступны для использования и вывода **только** владельцу аккаунта, с которого средства были отправлены на контракт.


## Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

**Чтобы успешно выполнить данный урок необходимо:**
- обратиться к контракту [BuilderTokenEther](https://github.com/airalab/core/wiki/API-Reference#buildertokenether) в DAO factory с названием `Aira BuilderTokenEther` (`0xbb2695e90d82c6e4b87da5db29a6762645c7d6f5`) для создания контракта, который будет хранить эфиры.
- перевести **0,1** эфир на свой счет в контракте [TokenEther](https://github.com/airalab/core/wiki/API-Reference#tokenether), созданном вами ранее.
- обратиться к контракту `Lesson 3` для вызова функции `Execute()` указав `адрес контракта для хранения эфиров` и  имея **0,1** эфир на счету своего аккаунта на контракте.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-3)

## Урок 4: Превратите акции ДАО в управленческий капитал фонда организации.
> Уровень сложности урока: средний.

**Создаваемые на данном уроке модули ДАО:**
- `Cashflow`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderCashFlow` ([abi](https://github.com/airalab/core/blob/master/abi/builder/BuilderCashFlow.json)
- `DAO core` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/Core.json))
- `Cashflow` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/Cashflow.json))
- `Ether funds` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEther.json))

### Описание урока
Теперь вам необходим модуль [Cashflow](https://github.com/airalab/core/wiki/API-Reference#cashflow) для дальнейшего управления средствами  в совместном финасировании расходов организации с использованием `пропорционального голосования` (3).

>Пропорциональное голосование выбрано, как начальная форма управления общим фондов организации в силу её наибольшей защищенности от влияния расходования средств отдельного акционера в общем бюджете организации.

Имея общий бюджет и модуль ДАО `CashFlow` можно создавать [proposal](https://github.com/airalab/core/wiki/API-Reference#proposal) указывая:
- `Адрес в сети Ethereum - цель финансирования`.
- Запрашиваемое финансирования, меньшее чем общая сумма средств на счету `Cashflow`.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Чтобы успешно выполнить данный урок необходимо обратиться к контракту `Lesson 5` для вызова функции `Execute()` указав `адрес контракта получивший успешно финансирование от ДАО` и сумму в эфирах, которую получил контракт.

#### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-4)

## Урок 5: Эмиссируйте новые акции лично привлекая финансирование в эфирах.
> Уровень сложности урока: средний.

**Создаваемые на данном уроке модули ДАО:**
- `ShareSale`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- Builder ?
- `Shareholder token`
- `ShareSale`
- `Ether funds`

### Описание урока
Создатель ДАО на данном этапе может лично эмиссировать дополнительные акции на свой счёт. Это может быть полезно в том, случаи если к примеру основатель лично договорился с первым(ыми) инвесторами о вхождении их в состав акционеров за счёт привлечения финансирования с их стороны. Чтобы выполнить данный процесс безопасно для обеих сторон можно обратиться к `DAO factory` и найти сборщик с названием [BuilderShareSale](https://github.com/airalab/core/wiki/API-Reference#buildersharesale), адрес `0x56c58efbf174dc82b4311a68b84bdfd5db13a3db`.

**При обращении к сборщику необходимо указать:**
- адрес контракта [CashFlow](https://github.com/airalab/core/wiki/API-Reference#cashflow)
- стоимость одной акции в `Wei`

**После создания контракта `ShareSale` необходимо:**
- Отправить на адрес контракта [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) количество акций предлагаемых для продажи по контракту.
- Отправить на адрес контракта [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) количество эфиров, требуемое для сделки.

> Важно: акции поступят на баланс адреса, который отправил на контракт [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) не забывайте это. Эфиры, которые будут получены по данному контракту попадут на счёт адреса контракта [CashFlow](https://github.com/airalab/core/wiki/API-Reference#cashflow).

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

-

#### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-5)

## Урок 6: Создайте внутренний рынок ДАО
> Уровень сложности урока: средний.

**Создаваемые на данном уроке модули ДАО:**
- `DAO market`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `DAO market`
- `ShareSale`
- `Ether funds`

### Описание урока
Создайте рынок ДАО и наполните его предложениями. Для начала необходимо обратиться к сборщику DAO factory [BuilderMarket](https://github.com/airalab/core/wiki/API-Reference#buildermarket), адрес в тестовой сети: `0xf57af9978a68d4816cee271c30f0a7ed35142d56`.

`Aira BuilderMarket` создаст рынок [Market](https://github.com/airalab/core/wiki/API-Reference#market), на котором возможно выставлять на продажу токены.

Для того, чтобы познакомиться с работой на рынке давайте создадим 2 лота:
- лот на продажу **1 000 shares** организации за **500 credits**;
- лот на покупку **500 credits** за **1 эфир**;

TO DO: Eugene примеры запросов на добавление лотов на рынке (полная инструкция с всеми необходимыми шагами)


## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Чтобы успешно выполнить данный урок необходимо обратиться к контракту `Lesson 6` для вызова функции `Execute()` указав `адрес рынка`.
> Важно: на вашем рынке должны быть минимум 2 лота.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-6)

## Урок 7: Добавьте регулятора внутреннего рынка ДАО
> Уровень сложности урока: средний.

## Описание урока
Контракты типа `MarketRegulator` получают от рынка информацию о всех сделках проходящих на рынке, а также лотах, которые добавляют на рынок агенты. В данном уроке мы создадим регулятора рынка, который будет разрешать добавление лотов только с токенами, находящимися в реестре ядра ДАО.

TO DO: akru создания регулятора, связанного с реестром ядра ДАО.

**Для того, чтобы  включить регулятора в работу рынка необходимо:**
- обратиться в `DAO factory` к контракту `Market regulator builder` указав `DAO core address`.
- обратиться с аккаунта создателя рынка `owner` к контракту `DAO market`, для вызова функции `regulator_switch`, передав адрес, созданного регулятора.

**После добавления регулятора рынка можно попробовать его в работе. Для этого необходимо:**
- обратиться  в `DAO factory` к контракту `Token Emission Builder` для создания нового токена, который будет отражать ценность на вашем рынке.
- попробуйте добавить лот с любым количеством токенов на рынок - вы должны будете получить сообщение следующего формата: "Данный токен не найден в реестре ядра ДАО".
- добавьте токен в реестр ядра ДАО.
- попробуйте снова добавить лот с любым количеством токенов на рынок - лот должен добавиться.

TO DO: akru прочитай логику, думаю, что есть что ещё доработать в контрактах для реализации данных шагов.

> Совет: например в DAO Aira на внутреннем рынке есть предложение токенов кураторства команды Aira для вашей DAO. 1 токен = 1 месяцу поддержки. Придумайте такой токен, который был бы полезен в дальнейшем в работе.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для прохождения данного урока, необходимо обратиться к контракту `Lesson 7`, для вызова функции `Execute()` указав `адрес рынка`.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Урок 8: Добавьте первого агента рынка
> Уровень сложности урока: средний.

Добавленный на предыдущем шаге регулятор выполняет не только функцию фильтрации предлагаемых на рынок ДАО ценностей, но также помагает выполнять свои задачи контрактам агента рынка. Контракты типа `MarketAgent` позволяют строить логику работы автономного агента с рынком без участия человека. В данном примере мы создадим самого простого агента, который будет автоматически выставлять на рынок все токены, которые будут разрешены для снятия контракту агента рынка, а также при покупке данных токенов на рынке за внутреннюю валюту `credits`, выполнять поиск покупателей `credits` для продажи их за эфиры. Тем самым автономный агент, желающий предложить свою ценность на внутреннем рынке ДАО, сможет сразу получать эфиры.

**Для того, чтобы  включить агента рынка в работу ДАО необходимо:**
- обратиться к `DAO factory` и найти контракт сборщика с названием `Market agent ether out`, при обращении к данному сборщику необходимо указать адрес токена ценности, которую вы хотите продавать на внутреннем рынке ДАО, а также адрес рынка. Советуем использовать токен, который был создан ранее в уроке 7.
- внести в реестр агентов рынка в контракте `Market regulator`, созданный контракт агента.

TO DO: akru создать билдер и написать пример обращения к билдеру с указанием данных для конструктора.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для прохождения данного урока, необходимо обратиться к контракту `Lesson 8`, для вызова функции `Execute()` указав `адрес контракта агента` и `адрес контракта рынка`.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Урок 9: Добавьте регулятора эмиссии кредитов.
> Уровень сложности урока: высокий.

На данный момент `owner`, создавший контракт токенов `credit` может бесконтрольно выполнять эмиссию новых токенов на свой баланс. Это помешает развитию вашего рынка и повышения ценности вашей внутренней валюты ДАО. Для того, чтобы решить данную проблему в данном уроке будет создан регулятор эмиссии токенов `credit` и внедрён в работу рынка с помощью голосования акционеров.

**Для того, чтобы внедрить регулятора эмиссии кредитов необходимо:**
- Обратиться к `DAO factory` и найти контракт сборщика с названием `Emission regulator via Market trade`, при обращении к данному сборщику необходимо указать `адрес токена внутренней валюты ДАО`, `адрес, на который будет происходить эмиссия новый токенов`, а также `процент эмиссируемых новых токенов`. В данном уроке, можно указать адрес, на который будет производиться эмиссия - адрес основателя DAO. В дальнейшем этом адрес может сменить `owner` контракта `Emission regulator via Market trade`.
- Добавть в реестр ядра новую запись с указанием `адреса контракта регулятора эмиссии` и названием `Credits emission regulator via Market trade`.
- Обратиться к контракту `Credits ledger` от аккаунта `owner` для смены адреса владельца на адрес контракта `Emission regulator via Market trade`.
- Обратиться к контракту `DAO market` вызвав функцию `AddMarketWatcher()`, указав адрес контракта `Emission regulator via Market trade` и тип событий `Deal`.

**Для того, чтобы проверить работу регулятора эмиссии:**
- Выполните любую сделку на рынке.
- Обратитесь к контракту `Credit ledger` и проверьте, что заданая вами сумма эмиссия в процентрах от сделки была эмиссирована на счет основателя DAO.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 200 `air`

Для того, чтобы успешно пройти урок необходимо  обратиться к контракту `Lesson 9`, для вызова функции `Execute()` указав `адрес контракта рынка`.

#### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Урок 10: Увеличивайте ликвидность ваших внутренних токенов ДАО (кредитов)
> Уровень сложности урока:  средний.

Помните, что главная задача любой организации - это создавать ценность для мира. Еще лучше если эта ценность будет ликвидна на внешних рынках. Ценность вашей организации теперь отражается внутренним токеном, а значит чем активнее рынок ДАО, чем больше сделок и больше интересных предложений на внутреннем рынке, тем ценнее токен, за который можно приобрести данные ценности.

**Для того, чтобы увеличить ликвидность кредитов вашей ДАО необходимо:**
- Инвестировать в создание новых ценностей, которые будут полезны на внутреннем рынке ДАО.
- Увеличивать активность агентов рынка. Создавайте новых агентов рынка, которые способны автоматически приобретать токены на рынке, при продаже своей продукции/услуг.
- Привлечь новых агентов рынка в вашем ДАО.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для того, чтобы успешно пройти урок необходимо обратиться к контракту `Lesson 10`, для вызова функции `Execute()` указав `адрес контракта рынка`. Обратите внимание, что вам необходимо, чтобы на рынке было минимум **5 активных** предложений покупки/продажи  на **разные** ценности.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Урок 11: Назначьте совет директоров организации
> Уровень сложности урока:  высокий.

**Создаваемые на данном уроке модули ДАО:**
- `Board of Directors`
- `Voting token`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Board of Directors builder`
- `Board of Directors`
- `Voting token`
- `Shareholder token`

### Описание урока
На данный момент ваша организация всё еще управляется всеми акционерами. Т.е. каждый акционер самостоятельно принимает решение об инвестровании средств пропорциональных его управленческому капиталу (количеству акций) в тот или иной запрос инвестирования. С ростом организации и количества акционеров необходимо изменять схему управление для внедрения избираемого совета директоров.

**Для того, чтобы внедрить совет директоров в работу организации необходимо:**
- Обратиться к `DAO factory` и найти контракт сборщика с названием `Board of Directors builder`, при обращении к данному сборщику необходимо указать адрес реестра акционеров `Shareholder token`, форму голосования `majority` (простое большинство, 51%) и адрес токена, хранящего капитал организации `Ether funds`.
- Создав контракт совета директоров `Board of Directors` необходимо раздать токены голосов `Voting token`, тем самым составить список членов совета директоров.
- Проголосовать как минимум 51% всех токенов акций `Shareholder token` за активирование токена совета директоров `Voting token` с помощью функции контракта `Board of Directors` `electBoardofDirectors()`.
- Указать владельцем контракта, хранящего капитал организации `Ether funds` контракт совета директоров `Board of Directors`.

> В контракте совета директоров можно создавать голосования по вопросу смены совета директоров, если в каком либо голосовании набирается 51% голосов, то управление переходит новому реестру участников совета. Акционеры не могут голосовать за несколько вариантов совета одновременно. Голосование замораживает акции акционера, акционер всегода может забрать свой голос, тем самым разморозить свои акции.

**Для того, чтобы попробовать работу совета директоров необходимо:**
- Создать запрос на финансирование `proposal` от любого из членов совета директоров.
- Провести встречу совета директоров и проголосовать за запрос финансорования, так чтобы набралось 51% голосов.
- Проверить поступление средств на счёт `target`.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 200 `air`

Для того, чтобы успешно пройти урок необходимо обратиться к контракту `Lesson 11`, для вызова функции `Execute()` указав `адрес контракта совета директоров`. Обратите внимание, что вам необходимо, чтобы совет директоров проголосовал и одобрил хотя бы за **1** запрос финансорования.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Урок 12: Crowdsale
> Уровень сложности урока: высокий.

**Создаваемые на данном уроке модули ДАО:**
- `Crowdsale`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `TokenEmission`. Контракт, хранящий реестр токенов внутренней валюты ДАО `DAO credit`.
- `Crowdsale`. Контракт, с помощью которого организуется распродажа токенов `DAO credit`.

### Описание урока
Помните самая важная задача организации - повышать ликвидность своей внутренней валюты, насыщая рынок ДАО предложениями. Для стимулирования рынка необходимо инвестировать в поставщиков ценностей рынка ДАО, а для этого необходимы существенные финансовые средства. Для того, чтобы привлечь дополнительные капиталы давайте выполним эмиссию и продажу по фиксированной цене внутренней валюты организации - crowdsale.

**Для того, чтобы выполнить crowdsale необходимо:**
- Обратиться к `DAO factory` и найти контракт сборщика с названием `Crowdsale builder`, при обращении к данному сборщику необходимо указать адрес реестра, хранящего токены `DAO credit`, а также адрес реестра, хранящего капитал организации в эфирах `Ether funds`.

Для увеличения количества токенов `DAO credit` за счёт привлечения финансирования необходимо воспользоваться сборщиком [BuilderCrowdsale](https://github.com/airalab/core/wiki/API-Reference#buildercrowdsale), который создаст модуль инфраструктуры ДАО [Crowdsale](https://github.com/airalab/core/wiki/API-Reference#crowdsale).

**Параметры, которые необходимо задать при обращении к сборщику `Crowdsale`:**
- Адрес контракта `Cashflow` для перевода на него средств при успешном завершении
- Адрес токена `DAO credit`
- Время старта Crowdsale (UNIX-время)
- Период проведения Crowdsale в секундах
- Начальная стоимость токена `DAO credit`
- Шаг увеличения стоимости в процентах
- Период шага увеличения стоимости в секундах
- Минимальную сумму привлекаемых средств
- Максимальную сумму привлекаемых средств

> в данном уроке максимальную сумму привлекаемых средств необходимо указать равной 5 эфиров.

*Внимание*: После создания контракта на его адрес необходимо перевести число токенов `DAO credit` для продажи.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 200 `air`

Для успешного прохождения урока необходимо внести 5 эфиров с любого аккаунта, который в дальнейшем станет владельцем новых токенов `DAO credit`. Чтобы закончить урок необходимо отправить транзакцию после наполнения Crowdsale 5 эфирами на `Lesson 12` вызвав функцию `Execute()`.

### Пример выполнения
- TO DO: Eugene пример с Ethereum wallet
- TO DO: vol4tim пример с geth

## Финальная модель ДАО.

Если были пройдены все уроки, описанные в данном документе, то финальная модель ДАО без учета контрактов `Crowdsale`, `ShareSale`, так как эти контракты, выполняли разовую функцию, будет следующей:

- `DAO core`
- `Shareholder token`
- `Ether funds`
- `Cashflow`
- `DAO market`
- `Market regulator`
- `Market agent`
- `Market agent builder`
- `Emission regulator via Market`
- `Token emission builder`
- `Board of Directors`
- `Voting token`

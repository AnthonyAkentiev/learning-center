# Учебный центр по созданию децентрализованных автономных организаций на платформе Ethereum
В данном документе содержаться основные учебные уроки по созданию собственной децентрализованной автономной организации (далее сокр. ДАО) с использованием автономных контрактов из репозитория [Aira core](https://github.com/airalab/core). Учебный курс создан для того, чтобы продемонстрировать гибкость в настройке организации, живущей в блокчейн сети на платформе Ethereum. От урока к уроку можно будет увидить, как меняется организация и какие возможности может предоставить использование умных контрактов.

> В июле 2016 года учебный центра будет работать только в тестовой сети.

## Урок 0: подготовьтесь к работе с сетью Ethereum через консоль.
> Данный урок существует только в тестовой сети.

## Описание урока
В данном уроке необходим клиент сети Ethereum, поддерживающий работу в консольном режиме. Рекомендуется использовать клиент сети [geth](https://github.com/ethereum/go-ethereum#automated-development-builds) или [parity](https://ethcore.io/parity.html).

После установки клиента сети необходимо выполнить синхронизацию с **тестовой сетью** и добыть крайне небольшую сумму токенов **ether** для отправки транзакции, требуемой для выполнения данного урока. Сделать это можно одним из следующих способов:
- **Самый простой способ.** Мы создали [бесплатную раздачу 0,01 эфира на сайте aira.life](http://aira.life/tap/). Необходимо указать адрес аккаунта в тестовой сети и нажать кнопку "Send 0.01 ether". В течении ~ минуты данная сумма будет зачислена на баланс указанного аккаунта.
- **Чтобы познакомитсья с майнингом поближе.** Cледуя [инструкциям в официальной документации Ethereum](http://www.ethdocs.org/en/latest/mining.html#using-geth) включить майнинг в тестовой сети примерно на 20 - 30 минут.
- **Чтобы познакомитсья с Airalab поближе.** Подключиться к каналу команды Airalab в Gitter: [Aira team friends](https://gitter.im/airalab/friends) и написать свой адрес в тестовой сети. Кто нибудь обязательно вам поможет!  

### Проверка умений
Добыв или получив от команды Airalab 0.01 ether для первой транзакции в сеть можно обратиться к контракту `Lesson 0` в тестовой сети, который отправит вам в ответ **5 эфиров**. Этой суммы будет достаточно для выполнения всех 12 уроков.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-0)

## Урок 1: создайте ядро децентрализованной автономной организации
> Уровень сложности урока: низкий.

**Создаваемые на данном уроке модули ДАО:**
- `DAO core`
- `Shareholder token`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderDAO` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/builder/BuilderDAO.json))
- `DAO core` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/Core.json))
- `Shareholder token` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEmission.json))

## Описание урока
Для начала работы необходимо создать ядро децентрализованной автономии `DAO core`. `DAO core` позволяет хранить реестр всех используемых организацией автономных контрактов. Для управления данным реестром (внесения/изменения/удаления записей) необходимо создать контракт, который будет хранить реестр акционеров организации `Shareholder token`.

Для того, чтобы создать `DAO core` и `Shareholder token` необходимо обратиться к фабрике ДАО отправив транзакцию со своего аккаунта к сборщику ядра `Aira BuilderDAO` следующего формата:

```js
var core_abi = Get data from here: https://raw.githubusercontent.com/airalab/core/master/abi/modules/Core.json
var factory = eth.contract(core_abi).at("0xa76422591378d14fb6d94c9da48a42498d8b51da")
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

### Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

**Чтобы успешно выполнить данный урок необходимо:**
Необходимо обратиться к контракту `Lesson 1` для вызова функции `Execute()` указав адрес контракта ядра ДАО `DAO core`. Контракт `Lesson 1` проверит совпадает ли переменная `owner` в контракте `DAO core` с вашим адресом отправителя транзакции.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-1)

## Урок 2: Распределите акции вашей организации
> Уровень сложности урока: низкий.

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Shareholder token` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEmission.json))

## Описание урока
При создании ДАО на баланс адреса создателя `founder` было эмисировано заданное количество токенов акций `Shareholder token`. Теперь время их распределить среди команды. Распределить акции можно двумя способами:
1. Напрямую отправить другому пользователю сети токены акций.
2. Создать контракт `Shareholder contract`, который снимет со счёта `founder`, указанное количество токенов акций при вызове функции `sign()` адресом, который был указан при создании данного контракта как получателя `recipient`.

Отличие данных способов перечисления токенов акций заключается в формате согласия. В первом случаи получатель `recipient` не даёт формального согласия на вход в соучередители. Во втором же мы протоколируем согласие функцией `sign()` и только после этого переводим токены акций.

### Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

Чтобы успешно выполнить данный урок необходимо разрешить снятие  1 акции `Shareholder token` адресу `Airalab learning center` и обратиться к контракту `Lesson 2` для вызова функции `Execute()`.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-2)

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

### Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

**Чтобы успешно выполнить данный урок необходимо:**
- обратиться к контракту [Aira BuilderTokenEther](https://github.com/airalab/core/wiki/API-Reference#buildertokenether) в DAO factory с названием `Aira BuilderTokenEther` (`0xbb2695e90d82c6e4b87da5db29a6762645c7d6f5`) для создания контракта, который будет хранить эфиры.
- перевести **0,1** эфир на свой счет в контракте [TokenEther](https://github.com/airalab/core/wiki/API-Reference#tokenether), созданном вами ранее.
- обратиться к контракту `Lesson 3` для вызова функции `Execute()` указав `адрес контракта для хранения эфиров` и  имея **0,1** эфир на счету своего аккаунта на контракте.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-3)


## Урок 4: Эмиссируйте новые акции лично привлекая финансирование в эфирах.
> Уровень сложности урока: средний.

**Создаваемые на данном уроке модули ДАО:**
- `ShareSale`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderShareSale` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/builder/BuilderShareSale.json))
- `Shareholder token` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEmission.json))
- `ShareSale` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/ShareSale.json))
- `Ether funds` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/modules/TokenEther.json))

### Описание урока
Создатель ДАО на данном этапе может лично эмиссировать дополнительные акции на свой счёт. Это может быть полезно в том, случаи если к примеру основатель лично договорился с первым(ыми) инвесторами о вхождении их в состав акционеров за счёт привлечения финансирования с их стороны. Чтобы выполнить данный процесс безопасно для обеих сторон можно обратиться к `DAO factory` и найти сборщик с названием [BuilderShareSale](https://github.com/airalab/core/wiki/API-Reference#buildersharesale), адрес `0x56c58efbf174dc82b4311a68b84bdfd5db13a3db`.

**При обращении к сборщику необходимо указать:**
- адрес получателя средств в эфирах `target`
- адрес контракта `Ether funds`
- адрес контракта `Shareholder token`
- количество продаваемых токенов `Shareholder token`
- требуемая сумма в ether для заключения сделки.

**После создания контракта `ShareSale` необходимо:**
- Со счета продавца в контракте `Shareholder token` отправить на адрес контракта [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) количество акций предлагаемых для продажи по контракту.
- С любого счёта покупателя (аккаунта или контракта) отправить на адрес контракта [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) количество эфиров, требуемое для сделки.
- Проверить поступление средств на счёт `target` в контракте `Ether funds`.
- Проверить поступление акций на счёт покупателя в контракте `Shareholder token`.

> Важно: акции поступят на баланс адреса, который отправил на контракт [ShareSale](https://github.com/airalab/core/wiki/API-Reference#sharesale) не забывайте это.

### Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Чтобы успешно выполнить данный урок необходимо выполнить продажу токенов акций за эфиры, после чего обратиться к контракту `Lesson 4` передав адрес контракта `ShareSale`.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-5)

## Урок 5: Подготовьтесь к созданию внутреннего рынка ДАО
> Уровень сложности урока: низкий.

Внутренний рынок ДАО требует токена `DAO credit`, к которому будут производиться сделки. Для того, чтобы создать данный токен необходимо:
- обратиться в `DAO factory` к контракту `Aira BuilderTokenEmission` указав необходимые параметры: `_name, _symbol, _decimals, _start_count`;
- обратиться с аккаунта создателя `DAO core` для добавления в реестр контрактов организации токена `DAO credit`.

### Проверка умений
> Успешное выполнение урока в официальной сети даст: 50 `air`

Чтобы успешно выполнить данный урок необходимо обратиться к контракту `Lesson 5` передав название созданного токена `_name` и адрес контракта `DAO core`. Обратите внимание, что для успешного прохождения урока необходимо, чтобы владельцем созданного токена внутренних кредитов организации (переменная `owner`) был адрес, с которого вы обращаетесь.

#### Пример выполнения
- TO DO: vol4tim пример с geth


## Урок 6: Создайте внутренний рынок ДАО
> Уровень сложности урока: средний.

**Создаваемые на данном уроке модули ДАО:**
- `DAO market`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Aira BuilderMarket` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/builder/BuilderMarket.json))
- `DAO market` ([abi](https://raw.githubusercontent.com/airalab/core/master/abi/builder/BuilderMarket.json))

### Описание урока
Создайте внутренний рынок ДАО и наполните его предложениями. Для начала необходимо обратиться к сборщику `DAO factory` [BuilderMarket](https://github.com/airalab/core/wiki/API-Reference#buildermarket), адрес в тестовой сети: `0xf57af9978a68d4816cee271c30f0a7ed35142d56`.

`Aira BuilderMarket` создаст рынок [Market](https://github.com/airalab/core/wiki/API-Reference#market), на котором возможно выставлять на продажу токены.

Для того, чтобы познакомиться с работой на рынке давайте создадим 2 лота:
- лот на продажу **1 000** токенов `Shareholder token` за **500** `DAO credit`;
- лот на покупку **500** токенов `DAO credit` за **1** ether;


## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Чтобы успешно выполнить данный урок необходимо обратиться к контракту `Lesson 6` для вызова функции `Execute()` указав `адрес рынка`.
> Важно: на вашем рынке должны быть минимум 2 лота.

### Пример выполнения
- [Пример выполнения урока с geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-6)

## Урок 7: Добавьте регулятора внутреннего рынка ДАО
> Уровень сложности урока: средний.

## Описание урока
При задействовании контракта типа `MarketRegulator` добавление на рынок лота становится возможно только при выполнении условий, установленных регулятором. В данном уроке мы создадим регулятора рынка `DAO market`, который будет разрешать добавление лотов только с токенами, находящимися в реестре ядра ДАО `DAO core`.

**Для того, чтобы  включить регулятора в работу рынка необходимо:**
- обратиться в `DAO factory` к контракту [Aira BuilderDAOMarketRegulator](https://github.com/airalab/core/wiki/API-Reference#builderdaomarketregulator) указав необходимые параметры: `_shares, _core, _market, _dao_credits`;
- обратиться с аккаунта владельца рынка`owner` к контракту [Market](https://github.com/airalab/core/wiki/API-Reference#market), для вызова функции `setMode(false)`, что переведет рынок `DAO market` в закрытый режим функционирования;
- делегировать рынок `DAO market` регулятору `MarketRegulator`, вызвав метод `delegate()` контракта рынка `DAO market` с адресом регулятора в аргументе.

**После добавления регулятора рынка можно попробовать его в работе. Для этого необходимо:**
- обратиться  в `DAO factory` к контракту `Aira BuilderTokenEmission` для создания нового токена, который будет отражать ценность на вашем рынке.
- попробуйте добавить лот с любым количеством токенов на рынок - транзакция завершится ошибкой, ведь токен не добавлен в реестр ядра ДАО.
- добавьте токен в реестр ядра ДАО.
- попробуйте снова добавить лот с любым количеством токенов на рынок - лот должен добавиться.

> Совет: например в DAO Aira на внутреннем рынке есть предложение токенов кураторства команды Aira для вашей DAO. 1 токен = 1 месяцу поддержки. Придумайте такой токен, который был бы полезен в дальнейшем в работе.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для прохождения данного урока, необходимо обратиться к контракту `Lesson 7`, для вызова функции `Execute()` указав `адрес рынка`, который вы создали.

### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-7)

## Урок 8: Добавьте первого агента рынка
> Уровень сложности урока: средний.

Добавленный на предыдущем шаге регулятор выполняет не только функцию фильтрации предлагаемых на рынок ДАО ценностей, но также помагает выполнять свои задачи контрактам агента рынка. Контракты типа `MarketAgent` выполняют роль представителя конечного пользователя на заданном рынке. Агент заключает сделки на рынке от лица клиента, аккумулирует ценности и берет на себя часть служебных функций, связанных с работой рынка и регулирования торговли.

**Для того, чтобы  включить агента рынка в работу ДАО необходимо:**
- Обратиться к контракту регулятора рынка и вызвать метод `sign()`, регулятор создаст контракт агента рынка и вызовет событие `MarketAgentSign(_client, _agent)`.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для прохождения данного урока, необходимо обратиться к контракту `Lesson 8`, для вызова функции `Execute()` указав `адрес контракта агента` и `адрес контракта рынка`.

### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-8)

## Урок 9: Добавьте регулятора эмиссии кредитов.
> Уровень сложности урока: высокий.

На данный момент `owner`, создавший контракт токенов `DAO credit` может бесконтрольно выполнять эмиссию новых токенов на свой баланс. Это помешает развитию вашего рынка и повышения ценности вашей внутренней валюты ДАО. Для того, чтобы решить данную проблему в данном уроке будет создан регулятор эмиссии токенов `DAO credit` и внедрён в работу рынка с помощью голосования акционеров.

Созданный на предыдущих уроках регулятор имеет возможность применять к заключаемым на рынке сделкам правила, устанавливаемые акционерами. Например, правило эмиссии токенов `DAO credit` при заключении сделки на определенный тип ценности. Правила устанавливаются акционерами посредством голосования акциями.

**Для того, чтобы внедрить регулятора эмиссии кредитов необходимо:**
- Обратиться к `DAO factory` и найти контракт сборщика с названием `Aira BuilderMarketRuleConstant`, при обращении к данному сборщику необходимо указать `количество эмиссируемых новых токенов`
- Проголосовать за правило вызвав метод `pollUp()` с аргументами: токен, для которого применяется правило, адрес правила, количество акций; **важно: акции должны быть доверены `approve` контракту регулятора перед вызовом метода**
- Обратиться к контракту `Credits ledger` от аккаунта `owner` для смены адреса владельца на адрес контракта регулятора рынка.

**Для того, чтобы проверить работу регулятора эмиссии:**
- Выполните любую сделку на рынке с участием токена, для которого применили правило.
- Обратитесь к контракту `Credit ledger` и проверьте, что заданая вами сумма эмиссия в процентрах от сделки была эмиссирована на счет основателя DAO.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 200 `air`

Для того, чтобы успешно пройти урок необходимо  обратиться к контракту `Lesson 9`, для вызова функции `Execute()` указав `адрес контракта рынка`.

#### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-9)

## Урок 10: Увеличивайте ликвидность ваших внутренних токенов ДАО (кредитов)
> Уровень сложности урока:  средний.

Помните, что главная задача любой организации - это создавать ценность для мира. Еще лучше если эта ценность будет ликвидна на внешних рынках. Ценность вашей организации теперь отражается внутренним токеном, а значит чем активнее рынок ДАО, чем больше сделок и больше интересных предложений на внутреннем рынке, тем ценнее токен, за который можно приобрести данные ценности.

**Для того, чтобы увеличить ликвидность кредитов вашей ДАО необходимо:**
- Добавить адрес контракта `Token emission builder` в ядро децентрализованной автономии.
- Инвестировать в создание новых ценностей, которые будут полезны на внутреннем рынке ДАО.
- Создавать токены с помощью `Token emission builder` и вносить их адреса в ядро децентарлизованной автономии, чтобы разрешить их продажу на рынке.
- Увеличивать активность агентов рынка. Создавайте новых агентов рынка, которые способны автоматически приобретать токены на рынке, при продаже своей продукции/услуг.
- Привлечь новых агентов рынка в вашем ДАО.

## Проверка умений
> Успешное выполнение урока в официальной сети даст: 100 `air`

Для того, чтобы успешно пройти урок необходимо обратиться к контракту `Lesson 10`, для вызова функции `Execute()` указав `адрес контракта рынка`. Обратите внимание, что вам необходимо, чтобы на рынке было минимум **5 активных** предложений покупки/продажи  на **разные** ценности.

### Пример выполнения
- [Пример выполнения урока в консольном клиенте сети Ethereum  geth](https://github.com/airalab/learning-center/blob/master/lessons%20passage.md#Урок-10)

## Урок 11: Назначьте совет директоров организации
> Уровень сложности урока:  высокий.

**Создаваемые на данном уроке модули ДАО:**
- `Board of Directors`
- `Directors voting token`

**Используемые для взаимодействия в данном уроке модули ДАО:**
- `Board of Directors builder`
- `Board of Directors`
- `Directors voting token`
- `Shareholder token`

### Описание урока
На данный момент в вашей организации всё ещё нет избранного акционерами совета директоров, каждый акционер самостоятельно принимает решение об инвестровании средств в тот или иной запрос инвестирования со своего счёта `Ether funds`, а управлением ядром организации занимается исключииельно основатель организации. С ростом организации и количества акционеров необходимо изменять схему управление для внедрения избираемого совета директоров. Совет директоров должен избираться акционерами, после чего члены совета смогут управлять средствами организации и ядром автономии. 

**Для того, чтобы внедрить совет директоров в работу организации необходимо:**
- Обратиться к `DAO factory` и найти контракт сборщика с названием `Board of Directors builder`, при обращении к данному сборщику необходимо указать адрес реестра акционеров `Shareholder token`, форму голосования `majority` (простое большинство, 51%) и адрес токена, хранящего капитал организации `Ether funds`.
- Создав контракт совета директоров `Board of Directors` необходимо раздать токены голосов `Directors voting token`, тем самым составить список членов совета директоров.
- Проголосовать как минимум 51% всех токенов акций `Shareholder token` за активирование токена совета директоров `Directors voting token` с помощью функции контракта `Board of Directors` `electBoardofDirectors()`.
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
- TO DO: vol4tim пример с geth

## Финальная модель ДАО.

Если были пройдены все уроки, описанные в данном документе, то финальная модель ДАО без учета контрактов `Crowdsale`, `ShareSale`, так как эти контракты, выполняли разовую функцию, будет следующей:

- `DAO core`
- `Shareholder token`
- `Ether funds`
- `DAO credit`
- `DAO market`
- `Market regulator`
- `Market agent`
- `Market rule constant`
- `Token emission builder`
- `Board of Directors`
- `Voting token`

# frozen_string_literal: true

require 'czech_declensions/version'

module CzechDeclensions
  def self.initialize
    @vzor = []
    @isdbgmode = false
    #
    # Přídavná jména a zájmena
    #
    @vzor << ['m', '-ký', 'kého', 'kému', 'ký/kého', 'ký', 'kém', 'kým', '-ké/-cí', 'kých', 'kým', 'ké', '-ké/-cí',
              'kých', 'kými']
    @vzor << ['m', '-rý', 'rého', 'rému', 'rý/rého', 'rý', 'rém', 'rým', '-ré/-ří', 'rých', 'rým', 'ré', '-ré/-ří',
              'rých', 'rými']
    @vzor << ['m', '-chý', 'chého', 'chému', 'chý/chého', 'chý', 'chém', 'chým', '-ché/-ší', 'chých', 'chým', 'ché', '-ché/-ší',
              'chých', 'chými']
    @vzor << ['m', '-hý', 'hého', 'hému', 'hý/hého', 'hý', 'hém', 'hým', '-hé/-zí', 'hých', 'hým', 'hé', '-hé/-zí',
              'hých', 'hými']
    @vzor << ['m', '-ý', 'ého', 'ému', 'ý/ého', 'ý', 'ém', 'ým', '-é/-í', 'ých', 'ým', 'é', '-é/-í', 'ých',
              'ými']
    @vzor << ['m', '-[aeěií]cí', '0cího', '0címu', '0cí/0cího', '0cí', '0cím', '0cím', '0cí', '0cích', '0cím', '0cí', '0cí',
              '0cích', '0cími']
    @vzor << ['ž', '-[aeěií]cí', '0cí', '0cí', '0cí', '0cí', '0cí', '0cí', '0cí', '0cích', '0cím', '0cí', '0cí',
              '0cích', '0cími']
    @vzor << ['s', '-[aeěií]cí', '0cího', '0címu', '0cí/0cího', '0cí', '0cím', '0cím', '0cí', '0cích', '0cím', '0cí', '0cí',
              '0cích', '0cími']
    @vzor << ['m', '-[bcčdhklmnprsštvzž]ní', '0ního', '0nímu', '0ní/0ního', '0ní', '0ním', '0ním', '0ní', '0ních', '0ním',
              '0ní', '0ní', '0ních', '0ními']
    @vzor << ['ž', '-[bcčdhklmnprsštvzž]ní', '0ní', '0ní', '0ní', '0ní', '0ní', '0ní', '0ní', '0ních', '0ním',
              '0ní', '0ní', '0ních', '0ními']
    @vzor << ['s', '-[bcčdhklmnprsštvzž]ní', '0ního', '0nímu', '0ní/0ního', '0ní', '0ním', '0ním', '0ní', '0ních', '0ním',
              '0ní', '0ní', '0ních', '0ními']

    @vzor << ['m', '-[i]tel', '0tele', '0teli', '0tele', '0tel', '0teli', '0telem', '0telé', '0telů', '0telům', '0tele', '0telé',
              '0telích', '0teli']
    @vzor << ['m', '-[í]tel', '0tele', '0teli', '0tele', '0tel', '0teli', '0telem', 'átelé', 'áteli', 'átelům', 'átele', 'átelé',
              'átelích', 'áteli']

    @vzor << ['s', '-é', 'ého', 'ému', 'é', 'é', 'ém', 'ým', '-á', 'ých', 'ým', 'á', 'á', 'ých', 'ými']
    @vzor << ['ž', '-á', 'é', 'é', 'ou', 'á', 'é', 'ou',              '-é', 'ých', 'ým', 'é', 'é', 'ých', 'ými']
    @vzor << ['-', 'já', 'mne', 'mně', 'mne/mě', 'já', 'mně', 'mnou', 'my', 'nás', 'nám', 'nás', 'my', 'nás', 'námi']
    @vzor << ['-', 'ty', 'tebe', 'tobě', 'tě/tebe', 'ty', 'tobě', 'tebou', 'vy', 'vás', 'vám', 'vás', 'vy', 'vás',
              'vámi']
    @vzor << ['-', 'my', '', '', '', '', '', '', 'my', 'nás', 'nám', 'nás', 'my', 'nás', 'námi']
    @vzor << ['-', 'vy', '', '', '', '', '', '', 'vy', 'vás', 'vám', 'vás', 'vy', 'vás', 'vámi']
    @vzor << ['m', 'on', 'něho', 'mu/jemu/němu', 'ho/jej', 'on', 'něm', 'ním', 'oni', 'nich', 'nim', 'je', 'oni', 'nich',
              'jimi/nimi']
    @vzor << ['m', 'oni', '', '', '', '', '', '', 'oni', 'nich', 'nim', 'je', 'oni', 'nich', 'jimi/nimi']
    @vzor << ['ž', 'ony', '', '', '', '', '', '', 'ony', 'nich', 'nim', 'je', 'ony', 'nich', 'jimi/nimi']
    @vzor << ['s', 'ono', 'něho', 'mu/jemu/němu', 'ho/jej', 'ono', 'něm', 'ním', 'ona', 'nich', 'nim', 'je', 'ony', 'nich',
              'jimi/nimi']
    @vzor << ['ž', 'ona', 'ní', 'ní', 'ji', 'ona', 'ní', 'ní', 'ony', 'nich', 'nim', 'je', 'ony', 'nich', 'jimi/nimi']
    @vzor << %w[m ten toho tomu toho ten tom tím ti těch těm ty ti těch těmi]
    @vzor << %w[ž ta té té tu ta té tou ty těch těm ty ty těch těmi]
    @vzor << %w[s to toho tomu toho to tom tím ta těch těm ta ta těch těmi]

    # přivlastňovací zájmena
    @vzor << %w[m můj mého mému mého můj mém mým mí mých mým mé mí mých
                mými]
    @vzor << %w[ž má mé mé mou má mé mou mé mých mým mé mé mých
                mými]
    @vzor << %w[ž moje mé mé mou má mé mou mé mých mým mé mé mých
                mými]
    @vzor << %w[s mé mého mému mého moje mém mým má mých mým mé má mých
                mými]
    @vzor << %w[s moje mého mému mého moje mém mým má mých mým mé má mých
                mými]

    @vzor << %w[m tvůj tvého tvému tvého tvůj tvém tvým tví tvých tvým tvé tví
                tvých tvými]
    @vzor << %w[ž tvá tvé tvé tvou tvá tvé tvou tvé tvých tvým tvé tvé
                tvých tvými]
    @vzor << %w[ž tvoje tvé tvé tvou tvá tvé tvou tvé tvých tvým tvé tvé
                tvých tvými]
    @vzor << %w[s tvé tvého tvému tvého tvůj tvém tvým tvá tvých tvým tvé tvá
                tvých tvými]
    @vzor << %w[s tvoje tvého tvému tvého tvůj tvém tvým tvá tvých tvým tvé tvá
                tvých tvými]

    @vzor << %w[m náš našeho našemu našeho náš našem našim naši našich našim naše
                naši našich našimi]
    @vzor << %w[ž naše naší naší naši naše naší naší naše našich našim naše
                naše našich našimi]
    @vzor << %w[s naše našeho našemu našeho naše našem našim naše našich našim naše
                naše našich našimi]

    @vzor << %w[m váš vašeho vašemu vašeho váš vašem vašim vaši vašich vašim vaše
                vaši vašich vašimi]
    @vzor << %w[ž vaše vaší vaší vaši vaše vaší vaší vaše vašich vašim vaše
                vaše vašich vašimi]
    @vzor << %w[s vaše vašeho vašemu vašeho vaše vašem vašim vaše vašich vašim vaše
                vaše vašich vašimi]

    @vzor << %w[m jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho
                jeho jeho]
    @vzor << %w[ž jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho
                jeho jeho]
    @vzor << %w[s jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho jeho
                jeho jeho]

    @vzor << %w[m její jejího jejímu jejího její jejím jejím její jejích jejím její
                její jejích jejími]
    @vzor << %w[s její jejího jejímu jejího její jejím jejím její jejích jejím její
                její jejích jejími]
    @vzor << %w[ž její její její její její její její její jejích jejím její
                její jejích jejími]

    @vzor << %w[m jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich
                jejich jejich jejich]
    @vzor << %w[s jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich
                jejich jejich jejich]
    @vzor << %w[ž jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich jejich
                jejich jejich jejich]

    # výjimky (zvl. běžná slova)
    @vzor << ['m', '-bůh', 'boha', 'bohu', 'boha', 'bože', 'bohovi', 'bohem', 'bozi/bohové', 'bohů', 'bohům', 'bohy',
              'bozi/bohové', 'bozích', 'bohy']
    @vzor << ['m', '-pan', 'pana', 'panu', 'pana', 'pane', 'panu', 'panem', 'páni/pánové', 'pánů', 'pánům', 'pány',
              'páni/bohové', 'pánech', 'pány']
    @vzor << ['-', '-dveře', '', '', '', '', '', '', 'dveře', 'dveří', 'dveřím', 'dveře', 'dveře', 'dveřích', 'dveřmi']
    @vzor << ['m', '-vztek', 'vzteku', 'vzteku', 'vztek', 'vzteku', 'vzteku',  'vztekem', 'vzteky', 'vzteků', 'vztekům',
              'vzteky', 'vzteky', 'vztecích', 'vzteky']
    @vzor << ['m', '-dotek', 'doteku', 'doteku', 'dotek', 'doteku', 'doteku',  'dotekem', 'doteky', 'doteků', 'dotekům',
              'doteky', 'doteky', 'dotecích', 'doteky']
    @vzor << ['ž', '-hra', 'hry', 'hře', 'hru', 'hro', 'hře', 'hrou', 'hry', 'her', 'hrám', 'hry', 'hry', 'hrách',
              'hrami']

    # číslovky
    @vzor << ['-', '-tdva',   'tidvou',  'tidvoum',   'tdva',  'tdva',  'tidvou',   'tidvěmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tdvě',   'tidvou',  'tidvěma',   'tdva',  'tdva',  'tidvou',   'tidvěmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-ttři',   'titří',   'titřem',    'ttři',  'ttři',  'titřech',  'titřemi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tčtyři', 'tičtyřech', 'tičtyřem', 'tčtyři', 'tčtyři', 'tičtyřech', 'tičtyřmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tpět',   'tipěti',   'tipěti',   'tpět', 'tpět', 'tipěti', 'tipěti', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tšest',  'tišesti',  'tišesti',  'tšest',  'tšest', 'tišesti',  'tišesti', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tsedm',  'tisedmi',  'tisedmi',  'tsedm',  'tsedm', 'tisedmi',  'tisedmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tosm',   'tiosmi',   'tiosmi',   'tosm',   'tosm', 'tiosmi', 'tiosmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-tdevět', 'tidevíti', 'tidevíti', 'tdevět', 'tdevět', 'tidevíti', 'tidevíti', '?', '?', '?', '?', '?', '?',
              '?']

    @vzor << ['ž', '-jedna', 'jedné', 'jedné', 'jednu', 'jedno', 'jedné', 'jednou', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['m', '-jeden', 'jednoho', 'jednomu', 'jednoho', 'jeden', 'jednom', 'jedním', '?', '?', '?', '?', '?',
              '?', '?']
    @vzor << ['s', '-jedno', 'jednoho', 'jednomu', 'jednoho', 'jedno', 'jednom', 'jedním', '?', '?', '?', '?', '?',
              '?', '?']
    @vzor << ['-', '-dva', 'dvou', 'dvoum', 'dva', 'dva', 'dvou', 'dvěmi', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-dvě', 'dvou', 'dvoum', 'dva', 'dva', 'dvou', 'dvěmi', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-tři', 'tří', 'třem', 'tři', 'tři', 'třech', 'třemi', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-čtyři', 'čtyřech', 'čtyřem', 'čtyři', 'čtyři', 'čtyřech', 'čtyřmi', '?', '?', '?', '?', '?', '?',
              '?']
    @vzor << ['-', '-pět', 'pěti', 'pěti', 'pět', 'pět', 'pěti', 'pěti', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-šest', 'šesti', 'šesti', 'šest', 'šest', 'šesti', 'šesti', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-sedm', 'sedmi', 'sedmi', 'sedm', 'sedm', 'sedmi', 'sedmi', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-osm', 'osmi', 'osmi', 'osm', 'osm', 'osmi', 'osmi', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-devět', 'devíti', 'devíti', 'devět', 'devět', 'devíti', 'devíti', '?', '?', '?', '?', '?', '?',
              '?']

    @vzor << ['-', 'deset', 'deseti', 'deseti', 'deset', 'deset', 'deseti', 'deseti', '?', '?', '?', '?', '?', '?', '?']
    @vzor << ['-', '-ná[cs]t', 'ná0ti', 'ná0ti', 'ná0t', 'náct', 'ná0ti', 'ná0ti', '?', '?', '?', '?', '?', '?', '?']

    @vzor << ['-', '-dvacet', 'dvaceti', 'dvaceti', 'dvacet', 'dvacet', 'dvaceti', 'dvaceti', '?', '?', '?', '?', '?',
              '?', '?']
    @vzor << ['-', '-třicet', 'třiceti', 'třiceti', 'třicet', 'třicet', 'třiceti', 'třiceti', '?', '?', '?', '?', '?',
              '?', '?']
    @vzor << ['-', '-čtyřicet', 'čtyřiceti', 'čtyřiceti', 'čtyřicet', 'čtyřicet', 'čtyřiceti', 'čtyřiceti', '?', '?', '?', '?',
              '?', '?', '?']
    @vzor << ['-', '-desát', 'desáti', 'desáti', 'desát', 'desát', 'desáti', 'desáti', '?', '?', '?', '?', '?', '?',
              '?']

    #
    # Spec. přídady skloňování(+předseda, srdce jako úplná výjimka)
    #
    @vzor << ['m', '-[i]sta', '0sty', '0stovi', '0stu', '0sto', '0stovi', '0stou', '-0sté', '0stů', '0stům', '0sty', '0sté',
              '0stech', '0sty']
    @vzor << ['m', '-[o]sta', '0sty', '0stovi', '0stu', '0sto', '0stovi', '0stou', '-0stové', '0stů', '0stům', '0sty', '0sté',
              '0stech', '0sty']
    @vzor << ['m', '-předseda', 'předsedy', 'předsedovi', 'předsedu', 'předsedo', 'předsedovi', 'předsedou', 'předsedové',
              'předsedů', 'předsedům', 'předsedy', 'předsedové', 'předsedech', 'předsedy']
    @vzor << ['m', '-srdce', 'srdce', 'srdi', 'sdrce', 'srdce', 'srdci', 'srdcem', 'srdce', 'srdcí', 'srdcím', 'srdce', 'srdce',
              'srdcích', 'srdcemi']
    @vzor << ['m', '-[db]ce',  '0ce', '0ci', '0ce', '0če', '0ci', '0cem', '0ci/0cové', '0ců', '0cům', '0ce', '0ci/0cové', '0cích',
              '0ci']
    @vzor << ['m', '-[jň]ev',  '0evu', '0evu', '0ev', '0eve', '0evu', '0evem', '-0evy', '0evů', '0evům',
              '0evy', '0evy', '0evech', '0evy']
    @vzor << ['m', '-[lř]ev',  '0evu/0va', '0evu/0vovi', '0ev/0va', '0eve/0ve', '0evu/0vovi', '0evem/0vem',
              '-0evy/0vové', '0evů/0vů', '0evům/0vům', '0evy/0vy', '0evy/0vové', '0evech/0vech', '0evy/0vy']

    @vzor << ['m', '-ů[lz]', 'o0u/o0a', 'o0u/o0ovi', 'ů0/o0a', 'o0e', 'o0u', 'o0em', 'o-0y/o-0ové', 'o0ů', 'o0ům', 'o0y',
              'o0y/o0ové', 'o0ech', 'o0y']

    # výj. nůž (vzor muž)
    @vzor << %w[m nůž nože noži nůž noži noži nožem nože nožů nožům nože nože nožích
                noži]

    #
    # Vzor kolo
    #
    @vzor << ['s', '-[bcčdghksštvzž]lo', '0la', '0lu', '0lo', '0lo', '0lu', '0lem', '-0la', '0el', '0lům', '0la', '0la', '0lech',
              '0ly']
    @vzor << ['s', '-[bcčdnsštvzž]ko', '0ka', '0ku', '0ko', '0ko', '0ku', '0kem',         '-0ka', '0ek', '0kům', '0ka', '0ka',
              '0cích/0kách', '0ky']
    @vzor << ['s', '-[bcčdksštvzž]no', '0na', '0nu', '0no', '0no', '0nu', '0nem',         '-0na', '0en', '0nům', '0na', '0na',
              '0nech/0nách', '0ny']
    @vzor << ['s', '-o', 'a', 'u', 'o', 'o', 'u', 'em',            '-a', '', 'ům', 'a', 'a', 'ech', 'y']

    #
    # Vzor stavení
    #
    @vzor << ['s', '-í', 'í', 'í', 'í', 'í', 'í', 'ím',            '-í', 'í', 'ím', 'í', 'í', 'ích', 'ími']
    #
    # Vzor děvče  (če,dě,tě,ně,pě) výj.-také sele
    #
    @vzor << ['s', '-[čďť][e]', '10te', '10ti', '10', '10', '10ti', '10tem', '1-ata', '1at', '1atům', '1ata', '1ata', '1atech',
              '1aty']
    @vzor << ['s', '-[pb][ě]', '10te', '10ti', '10', '10', '10ti', '10tem', '1-ata', '1at', '1atům', '1ata', '1ata', '1atech',
              '1aty']

    #
    # Vzor žena
    #
    @vzor << ['ž', '-[aeiouyáéíóúý]ka', '0ky', '0ce', '0ku', '0ko', '0ce', '0kou', '-0ky', '0k', '0kám', '0ky', '0ky',
              '0kách', '0kami']
    @vzor << ['ž', '-ka', 'ky', 'ce', 'ku', 'ko', 'ce', 'kou', '-ky', 'ek', 'kám', 'ky', 'ky', 'kách', 'kami']
    @vzor << ['ž', '-[bdghkmnptvz]ra', '0ry', '0ře', '0ru', '0ro', '0ře', '0rou', '-0ry', '0er', '0rám', '0ry', '0ry',
              '0rách', '0rami']
    @vzor << ['ž', '-ra', 'ry', 'ře', 'ru', 'ro', 'ře', 'rou', '-ry', 'r', 'rám', 'ry', 'ry', 'rách', 'rami']
    @vzor << ['ž', '-[tdbnvmp]a', '0y', '0ě', '0u', '0o', '0ě', '0ou', '-0y', '0', '0ám', '0y', '0y', '0ách', '0ami']
    @vzor << ['ž', '-cha', 'chy', 'še', 'chu', 'cho', 'še', 'chou', '-chy', 'ch', 'chám', 'chy', 'chy', 'chách',
              'chami']
    @vzor << ['ž', '-[gh]a', '0y', 'ze', '0u', '0o', 'ze', '0ou',   '-0y', '0', '0ám', '0y', '0y', '0ách', '0ami']
    @vzor << ['ž', '-ňa', 'ni', 'ně', 'ňou', 'ňo', 'ni', 'ňou',     '-ně/ničky', 'ň', 'ňám', 'ně/ničky', 'ně/ničky', 'ňách',
              'ňami']
    @vzor << ['ž', '-[šč]a', '0i', '0e', '0u', '0o', '0e', '0ou', '-0e/0i', '0', '0ám', '0e/0i', '0e/0i', '0ách',
              '0ami']
    @vzor << %w[ž Dagmar Dagmary Dagmaře Dagmaru Dagmaro Dagmaře Dagmarou Dagmary Dagmar
                Dagmarám Dagmary Dagmary Dagmarách Dagmarami]
    @vzor << ['ž', '-a', 'y', 'e', 'u', 'o', 'e', 'ou', '-y', '', 'ám', 'y', 'y', 'ách', 'ami']

    # vz. píseň
    @vzor << ['ž', '-eň', 'ně', 'ni', 'eň', 'ni', 'ni', 'ní',       '-ně', 'ní', 'ním', 'ně', 'ně', 'ních', 'němi']
    @vzor << ['ž', '-oň', 'oně', 'oni', 'oň', 'oni', 'oni', 'oní',  '-oně', 'oní', 'oním', 'oně', 'oně', 'oních',
              'oněmi']
    @vzor << ['ž', '-[ě]j', '0je', '0ji', '0j', '0ji', '0ji', '0jí', '-0je', '0jí', '0jím', '0je', '0je', '0jích',
              '0jemi']

    #
    # Vzor růže
    #
    @vzor << ['ž', '-ev', 've', 'vi', 'ev', 'vi', 'vi', 'ví', '-ve', 'ví', 'vím', 've', 've', 'vích', 'vemi']
    @vzor << ['ž', '-ice', 'ice', 'ici', 'ici', 'ice', 'ici', 'icí', '-ice', 'ic', 'icím', 'ice', 'ice', 'icích',
              'icemi']
    @vzor << ['ž', '-e', 'e', 'i', 'i', 'e', 'i', 'í', '-e', 'í', 'ím', 'e', 'e', 'ích', 'emi']

    #
    # Vzor píseň
    #
    @vzor << ['ž', '-[eaá][jžň]', '10e/10i', '10i', '10', '10i', '10i', '10í', '-10e/10i', '10í', '10ím', '10e', '10e', '10ích',
              '10emi']
    @vzor << ['ž', '-[eayo][š]', '10e/10i', '10i', '10', '10i', '10i', '10í', '10e/10i', '10í', '10ím', '10e', '10e', '10ích',
              '10emi']
    @vzor << ['ž', '-[íy]ň', '0ně', '0ni', '0ň', '0ni', '0ni', '0ní', '-0ně', '0ní', '0ním', '0ně', '0ně', '0ních',
              '0němi']
    @vzor << ['ž', '-[íyý]ňe', '0ně', '0ni', '0ň', '0ni', '0ni', '0ní', '-0ně', '0ní', '0ním', '0ně', '0ně', '0ních',
              '0němi']
    @vzor << ['ž', '-[ťďž]', '0e', '0i', '0', '0i', '0i', '0í', '-0e', '0í', '0ím', '0e', '0e', '0ích', '0emi']
    @vzor << ['ž', '-toř', 'toře', 'toři', 'toř', 'toři', 'toři', 'toří', '-toře', 'toří', 'tořím', 'toře', 'toře', 'tořích',
              'tořemi']

    #
    # Vzor kost
    #
    @vzor << ['ž', '-st', 'sti', 'sti', 'st', 'sti', 'sti', 'stí', '-sti', 'stí', 'stem', 'sti', 'sti', 'stech', 'stmi']
    @vzor << %w[ž ves vsi vsi ves vsi vsi vsí vsi vsí vsem vsi vsi vsech
                vsemi]

    #
    # Vzor Amadeus, Celsius, Kumulus, rektikulum, praktikum
    #
    @vzor << ['m', '-[e]us',   '0a',  '0u/0ovi', '0a',  '0e', '0u/0ovi', '0em', '0ové', '0ů', '0ům', '0y', '0ové',
              '0ích', '0y']
    @vzor << ['m', '-[i]us',   '0a',  '0u/0ovi', '0a',  '0e', '0u/0ovi', '0em', '0ové', '0ů', '0ům', '0usy', '0ové',
              '0ích', '0usy']
    @vzor << ['m', '-[i]s',    '0se', '0su/0sovi', '0se', '0se/0si', '0su/0sovi', '0sem', '0sy/0sové', '0sů', '0sům',
              '0sy', '0sy/0ové', '0ech', '0sy']
    @vzor << %w[m výtrus výtrusu výtrusu výtrus výtruse výtrusu výtrusem výtrusy
                výtrusů výtrusům výtrusy výtrusy výtrusech výtrusy]
    @vzor << %w[m trus trusu trusu trus truse trusu trusem trusy trusů trusům
                trusy trusy trusech trusy]
    @vzor << ['m', '-[aeioumpts][lnmrktp]us', '10u/10a', '10u/10ovi', '10us/10a', '10e', '10u/10ovi', '10em',
              '10y/10ové', '10ů', '10ům', '10y', '10y/10ové', '10ech', '10y']
    @vzor << ['s', '-[l]um',    '0a',  '0u', '0um',  '0um', '0u', '0em',  '0a', '0', '0ům', '0a', '0a', '0ech',  '0y']
    @vzor << ['s', '-[k]um',    '0a',  '0u', '0um',  '0um', '0u', '0em',  '0a', '0', '0ům', '0a', '0a', '0cích', '0y']
    @vzor << ['s', '-[i]um',    '0a',  '0u', '0um',  '0um', '0u', '0em',  '0a', '0í', '0ům', '0a', '0a', '0iích',
              '0y']
    @vzor << ['s', '-[i]um',    '0a',  '0u', '0um',  '0um', '0u', '0em',  '0a', '0ejí', '0ům', '0a', '0a', '0ejích',
              '0y']
    @vzor << ['s', '-io', '0a', '0u', '0', '0', '0u', '0em',   '0a', '0í', '0ům', '0a', '0a', '0iích', '0y']

    #
    # Vzor sedlák
    #

    @vzor << ['m', '-[aeiouyáéíóúý]r', '0ru/0ra', '0ru/0rovi', '0r/0ra', '0re', '0ru/0rovi', '0rem', '-0ry/-0rové', '0rů',
              '0rům', '0ry', '0ry/0rové', '0rech', '0ry']
    # @vzor << [ "m","-[aeiouyáéíóúý]r","0ru/0ra","0ru/0rovi","0r/0ra","0re","0ru/0rovi","0rem",     "-0ry/-0ři","0rů","0rům","0ry","0ry/0ři", "0rech","0ry" ]
    @vzor << ['m', '-r', 'ru/ra', 'ru/rovi', 'r/ra', 'ře', 'ru/rovi', 'rem', '-ry/-rové', 'rů',
              'rům', 'ry', 'ry/rové', 'rech', 'ry']
    # @vzor << [ "m","-r",              "ru/ra",  "ru/rovi",  "r/ra",  "ře", "ru/rovi",   "rem",     "-ry/-ři", "rů","rům","ry",    "ry/ři",  "rech", "ry" ]
    @vzor << ['m', '-[bcčdnmprstvz]en', '0nu/0na', '0nu/0novi', '0en/0na', '0ne', '0nu/0novi', '0nem', '-0ny/0nové',
              '0nů', '0nům', '0ny', '0ny/0nové', '0nech', '0ny']
    @vzor << ['m', '-[dglmnpbtvzs]',  '0u/0a',  '0u/0ovi',  '0/0a',  '0e', '0u/0ovi',  '0em',     '-0y/0ové',  '0ů',
              '0ům', '0y',    '0y/0ové',  '0ech', '0y']
    @vzor << ['m', '-[x]',            '0u/0e',  '0u/0ovi',  '0/0e',  '0i', '0u/0ovi',  '0em',     '-0y/0ové',  '0ů',
              '0ům', '0y',    '0y/0ové',  '0ech', '0y']
    @vzor << ['m', 'sek', 'seku/seka', 'seku/sekovi', 'sek/seka', 'seku', 'seku/sekovi', 'sekem', 'seky/sekové', 'seků',
              'sekům', 'seky', 'seky/sekové', 'secích', 'seky']
    @vzor << ['m', 'výsek', 'výseku/výseka', 'výseku/výsekovi', 'výsek/výseka', 'výseku', 'výseku/výsekovi', 'výsekem',
              'výseky/výsekové', 'výseků', 'výsekům', 'výseky', 'výseky/výsekové', 'výsecích', 'výseky']
    @vzor << ['m', 'zásek', 'záseku/záseka', 'záseku/zásekovi', 'zásek/záseka', 'záseku', 'záseku/zásekovi', 'zásekem',
              'záseky/zásekové', 'záseků', 'zásekům', 'záseky', 'záseky/zásekové', 'zásecích', 'záseky']
    @vzor << ['m', 'průsek', 'průseku/průseka', 'průseku/průsekovi', 'průsek/průseka', 'průseku', 'průseku/průsekovi',
              'průsekem', 'průseky/průsekové', 'průseků', 'výsekům', 'průseky', 'průseky/průsekové', 'průsecích', 'průseky']
    @vzor << ['m', '-[cčšždnňmpbrstvz]ek', '0ku/0ka', '0ku/0kovi', '0ek/0ka', '0ku', '0ku/0kovi', '0kem', '-0ky/0kové',
              '0ků', '0kům', '0ky', '0ky/0kové', '0cích', '0ky']
    @vzor << ['m', '-[k]',            '0u/0a', '0u/0ovi', '0/0a', '0u', '0u/0ovi', '0em', '-0y/0ové', '0ů',
              '0ům', '0y', '0y/0ové', 'cích', '0y']
    @vzor << ['m', '-ch',             'chu/cha', 'chu/chovi', 'ch/cha', 'chu/cha', 'chu/chovi', 'chem', '-chy/chové',
              'chů', 'chům', 'chy', 'chy/chové', 'ších', 'chy']
    @vzor << ['m', '-[h]',            '0u/0a',   '0u/0ovi', '0/0a', '0u/0a', '0u/0ovi', '0em', '-0y/0ové', '0ů',
              '0ům', '0y', '0y/0ové', 'zích', '0y']
    @vzor << ['m', '-e[mnz]',         '0u/0a', '0u/0ovi', 'e0/e0a', '0e', '0u/0ovi', '0em', '-0y/0ové', '0ů',
              '0ům', '0y', '0y/0ové', '0ech', '0y']

    #
    # Vzor muž
    #
    @vzor << ['m', '-ec',         'ce',  'ci/covi',   'ec/ce',  'če',  'ci/covi',   'cem',   '-ce/cové',   'ců',
              'cům', 'ce',  'ce/cové',   'cích',  'ci']
    @vzor << ['m', '-[cčďšňřťž]', '0e',  '0i/0ovi',   '0e',     '0i',  '0i/0ovi',   '0em',   '-0e/0ové',   '0ů',
              '0ům', '0e',  '0e/0ové',   '0ích',  '0i']
    @vzor << ['m', '-oj',         'oje', 'oji/ojovi', 'oj/oje', 'oji', 'oji/ojovi', 'ojem',  '-oje/ojové', 'ojů',
              'ojům', 'oje', 'oje/ojové', 'ojích', 'oji']

    # Vzory pro přetypování rodu
    @vzor << ['m', '-[gh]a',     '0y', '0ovi', '0u', '0o', '0ovi', '0ou',    '0ové', '0ů',  '0ům', '0y', '0ové', 'zích',
              '0y']
    @vzor << ['m', '-[k]a',      '0y', '0ovi', '0u', '0o', '0ovi', '0ou',    '0ové', '0ů',  '0ům', '0y', '0ové', 'cích',
              '0y']
    @vzor << ['m', '-a',         'y',  'ovi', 'u', 'o', 'ovi', 'ou', 'ové', 'ů', 'ům', 'y', 'ové', 'ech', 'y']

    @vzor << ['ž', '-l',        'le',  'li', 'l', 'li', 'li', 'lí', 'le', 'lí', 'lím', 'le', 'le', 'lích', 'lemi']
    @vzor << ['ž', '-í',        'í', 'í', 'í', 'í', 'í', 'í', 'í', 'ích', 'ím', 'í', 'í', 'ích', 'ími']
    @vzor << ['ž', '-[jř]',     '0e',  '0i',   '0',  '0i', '0i', '0í',    '0e', '0í',  '0ím', '0e', '0e', '0ích',
              '0emi']
    @vzor << ['ž', '-[č]',      '0i',  '0i',   '0',  '0i', '0i', '0í',    '0i', '0í',  '0ím', '0i', '0i', '0ích',
              '0mi']
    @vzor << ['ž', '-[š]',      '0i',  '0i',   '0',  '0i', '0i', '0í',    '0i', '0í',  '0ím', '0i', '0i', '0ích',
              '0emi']

    @vzor << ['s', '-[sljřň]e', '0ete', '0eti', '0e', '0e', '0eti', '0etem', '0ata', '0at', '0atům', '0ata', '0ata',
              '0atech', '0aty']
    # @vzor << [ "ž","-cí",        "cí", "cí",  "cí", "cí", "cí", "cí",   "cí", "cích", "cím", "cí", "cí", "cích", "cími" ]
    # čaj, prodej, Ondřej, žokej
    @vzor << ['m', '-j',        'je',  'ji', 'j', 'ji', 'ji', 'jem', 'je/jové', 'jů', 'jům', 'je', 'je/jové',
              'jích', 'ji']
    # Josef, Detlef, ... ?
    @vzor << ['m', '-f',        'fa',  'fu/fovi', 'f/fa', 'fe', 'fu/fovi', 'fem', 'fy/fové', 'fů', 'fům', 'fy',
              'fy/fové', 'fech', 'fy']
    # zbroj, výzbroj, výstroj, trofej, neteř
    # jiří, podkoní, ... ?
    @vzor << ['m', '-í',        'ího', 'ímu', 'ího', 'í', 'ímu', 'ím',    'í', 'ích', 'ím', 'í', 'í', 'ích', 'ími']
    # Hugo
    @vzor << ['m', '-go', 'a', 'govi', 'ga', 'ga', 'govi', 'gem', 'gové', 'gů', 'gům', 'gy', 'gové',
              'zích', 'gy']
    # Kvido
    @vzor << ['m', '-o', 'a', 'ovi', 'a', 'a', 'ovi', 'em', 'ové', 'ů', 'ům', 'y', 'ové', 'ech', 'y']

    # doplňky
    # některá pomnožná jména
    @vzor << ['?', '-[tp]y', '?', '?', '?', '?', '?', '?', '-0y', '0', '0ům', '0y', '0y', '0ech', '0ami']
    @vzor << ['?', '-[k]y', '?', '?', '?', '?', '?', '?', '-0y', 'e0', '0ám', '0y', '0y', '0ách', '0ami']

    #  Výjimky:
    #  v1 - přehlásky
    # :  důl ... dol, stůl ... stol, nůž ... nož, hůl ... hole, půl ... půle
    @v1 = []
    #                      1.p   náhrada   4.p.
    #
    @v1 << %w[osel osl osla]
    @v1 << %w[karel karl karla]
    @v1 << %w[Karel Karl Karla]
    @v1 << %w[pavel pavl pavla]
    @v1 << %w[Pavel Pavl Pavla]
    @v1 << %w[Havel Havl Havla]
    @v1 << %w[havel havl havla]
    @v1 << %w[Bořek Bořk Bořka]
    @v1 << %w[bořek bořk bořka]
    @v1 << %w[Luděk Luďk Luďka]
    @v1 << %w[luděk luďk luďka]
    @v1 << %w[pes ps psa]
    @v1 << %w[pytel pytl pytel]
    @v1 << %w[ocet oct octa]
    @v1 << %w[chléb chleb chleba]
    @v1 << %w[chleba chleb chleba]
    @v1 << %w[pavel pavl pavla]
    @v1 << %w[kel kl kel]
    @v1 << %w[sopel sopl sopel]
    @v1 << %w[posel posl posla]
    @v1 << %w[důl dol důl]
    @v1 << %w[sůl sole sůl]
    @v1 << %w[vůl vol vola]
    @v1 << %w[půl půle půli]
    @v1 << %w[hůl hole hůl]
    @v1 << %w[stůl stol stůl]
    @v1 << %w[líh lih líh]
    @v1 << %w[sníh sněh sníh]
    @v1 << %w[zář záře zář]
    @v1 << %w[svatozář svatozáře svatozář]
    @v1 << %w[kůň koň koně]
    @v1 << %w[tůň tůňe tůň]
    # --- !
    @v1 << %w[prsten prstýnek prstýnku]
    @v1 << %w[smrt smrť smrt]
    @v1 << %w[vítr větr vítr]
    @v1 << %w[stupeň stupň stupeň]
    @v1 << %w[peň pň peň]
    @v1 << %w[cyklus cykl cyklus]
    @v1 << %w[dvůr dvor dvůr]
    @v1 << %w[zeď zď zeď]
    @v1 << %w[účet účt účet]
    @v1 << %w[mráz mraz mráz]
    @v1 << %w[hnůj hnoj hnůj]
    @v1 << %w[skrýš skrýše skrýš]
    @v1 << %w[nehet neht nehet]
    @v1 << %w[veš vš veš]
    @v1 << %w[déšť dešť déšť]
    @v1 << %w[myš myše myš]

    # v10 - zmena rodu na muzsky
    @v10 = []
    @v10 << 'sleď'
    @v10 << 'saša'
    @v10 << 'Saša'
    @v10 << 'dešť'
    @v10 << 'koň'
    @v10 << 'chlast'
    @v10 << 'plast'
    @v10 << 'termoplast'
    @v10 << 'vězeň'
    @v10 << 'sťežeň'
    @v10 << 'papež'
    @v10 << 'ďeda'
    @v10 << 'zeť'
    @v10 << 'háj'
    @v10 << 'lanýž'
    @v10 << 'sluha'
    @v10 << 'muž'
    @v10 << 'velmož'
    @v10 << 'Maťej'
    @v10 << 'maťej'
    @v10 << 'táta'
    @v10 << 'kolega'
    @v10 << 'mluvka'
    @v10 << 'strejda'
    @v10 << 'polda'
    @v10 << 'moula'
    @v10 << 'šmoula'
    @v10 << 'slouha'
    @v10 << 'drákula'
    @v10 << 'test'
    @v10 << 'rest'
    @v10 << 'trest'
    @v10 << 'arest'
    @v10 << 'azbest'
    @v10 << 'ametyst'
    @v10 << 'chřest'
    @v10 << 'protest'
    @v10 << 'kontest'
    @v10 << 'motorest'
    @v10 << 'most'
    @v10 << 'host'
    @v10 << 'kříž'
    @v10 << 'stupeň'
    @v10 << 'peň'
    @v10 << 'čaj'
    @v10 << 'prodej'
    @v10 << 'výdej'
    @v10 << 'výprodej'
    @v10 << 'ďej'
    @v10 << 'zloďej'
    @v10 << 'žokej'
    @v10 << 'hranostaj'
    @v10 << 'dobroďej'
    @v10 << 'darmoďej'
    @v10 << 'čaroďej'
    @v10 << 'koloďej'
    @v10 << 'sprej'
    @v10 << 'displej'
    @v10 << 'Aleš'
    @v10 << 'aleš'
    @v10 << 'Ambrož'
    @v10 << 'ambrož'
    @v10 << 'Tomáš'
    @v10 << 'Lukáš'
    @v10 << 'Tobiáš'
    @v10 << 'Jiří'
    @v10 << 'tomáš'
    @v10 << 'lukáš'
    @v10 << 'tobiáš'
    @v10 << 'jiří'
    @v10 << 'podkoní'
    @v10 << 'komoří'
    @v10 << 'Jirka'
    @v10 << 'jirka'
    @v10 << 'Ilja'
    @v10 << 'ilja'
    @v10 << 'Pepa'
    @v10 << 'Ondřej'
    @v10 << 'Andrej'
    #  @v10 << "josef"
    @v10 << 'mikuláš'
    @v10 << 'Mikuláš'
    @v10 << 'Mikoláš'
    @v10 << 'mikoláš'
    @v10 << 'Kvido'
    @v10 << 'kvido'
    @v10 << 'Hugo'
    @v10 << 'hugo'
    @v10 << 'Oto'
    @v10 << 'oto'
    @v10 << 'Otto'
    @v10 << 'otto'
    @v10 << 'Alexej'
    @v10 << 'alexej'
    @v10 << 'Ivo'
    @v10 << 'ivo'
    @v10 << 'Bruno'
    @v10 << 'bruno'
    @v10 << 'Alois'
    @v10 << 'alois'
    @v10 << 'bartoloměj'
    @v10 << 'Bartoloměj'
    @v10 << 'ernst'
    @v10 << 'Ernst'
    @v10 << 'ernest'
    @v10 << 'Ernest'

    # v11 - zmena rodu na zensky
    @v11 = []
    @v11 << 'vš'
    @v11 << 'dešť'
    @v11 << 'zteč'
    @v11 << 'řeč'
    @v11 << 'křeč'
    @v11 << 'kleč'
    @v11 << 'maštal'
    @v11 << 'vš'
    @v11 << 'kancelář'
    @v11 << 'závěj'
    @v11 << 'zvěř'
    @v11 << 'sbeř'
    @v11 << 'neteř'
    @v11 << 'ves'
    @v11 << 'rozkoš'
    #  @v11 << "myša"
    @v11 << 'postel'
    @v11 << 'prdel'
    @v11 << 'koudel'
    @v11 << 'koupel'
    @v11 << 'ocel'
    @v11 << 'digestoř'
    @v11 << 'konzervatoř'
    @v11 << 'oratoř'
    @v11 << 'zbroj'
    @v11 << 'výzbroj'
    @v11 << 'výstroj'
    @v11 << 'trofej'
    @v11 << 'obec'
    @v11 << 'Miriam'
    @v11 << 'miriam'
    @v11 << 'Ester'
    @v11 << 'Dagmar'

    # @v11 << "transmise"

    # v12 - zmena rodu na stredni
    @v12 = []
    @v12 << 'nemluvňe'
    @v12 << 'slůně'
    @v12 << 'kůzle'
    @v12 << 'sele'
    @v12 << 'osle'
    @v12 << 'zvíře'
    @v12 << 'kuře'
    @v12 << 'tele'
    @v12 << 'prase'
    @v12 << 'house'
    @v12 << 'vejce'

    # v0 - nedořešené výjimky
    @v0 = []
    #  @v0 << "ondřej"
    #  @v0 << "josef"
    #  @v0 << "déšť"
    @v0 << 'moře'
    @v0 << 'Ester'
    #  @v0 << "Dagmar"
    #  @v0 << "vejce"
    @v0 << 'housle'
    @v0 << 'šle'
    @v0 << 'ovoce'
    #  @v0 << "sleď"
    @v0 << 'Zeus'
    #  @v0 << "zbroj"
    #  @v0 << "výzbroj"
    #  @v0 << "výstroj"
    #  @v0 << "obec"
    #  @v0 << "konzervatoř"
    #  @v0 << "digestoř"
    @v0 << 'humus'
    @v0 << 'muka'
    @v0 << 'noe'
    @v0 << 'Noe'
    @v0 << 'Miriam'
    @v0 << 'miriam'
    # Je Nikola ženské nebo mužské jméno??? (podobně Sáva)

    # v3 - různé odchylky ve skloňování
    #    - časem by bylo vhodné opravit
    @v3 = []
    @v3 << 'jméno'
    @v3 << 'myš'
    @v3 << 'vězeň'
    @v3 << 'sťežeň'
    @v3 << 'oko'
    @v3 << 'sole'
    @v3 << 'šach'
    @v3 << 'veš'
    @v3 << 'myš'
    @v3 << 'klášter'
    @v3 << 'kněz'
    @v3 << 'král'
    @v3 << 'zď'
    @v3 << 'sto'
    @v3 << 'smrt'
    @v3 << 'leden'
    @v3 << 'len'
    @v3 << 'les'
    @v3 << 'únor'
    @v3 << 'březen'
    @v3 << 'duben'
    @v3 << 'květen'
    @v3 << 'červen'
    @v3 << 'srpen'
    @v3 << 'říjen'
    @v3 << 'pantofel'
    @v3 << 'žába'
    @v3 << 'zoja'
    @v3 << 'Zoja'
    @v3 << 'Zoe'
    @v3 << 'zoe'

    @astrtvar = []
    @vysledek = []
    @prefrod = '0'

    @acmpreg = []
  end

  def self.sklonovani(slovo, pad)
    initialize
    on_sklonuj(slovo)
    # puts @vysledek.inspect
    [@vysledek[pad], @prefrod]
  end

  def self.on_sklonuj(vstup)
    slova = vstup.split(' ')
    @prefrod = '0'
    slova.reverse.each do |slovo|
      # vysklonovani
      CzechDeclensions.skl2(slovo)
      # vynuceni rodu podle posledniho slova
      @prefrod = @astrtvar[0][0] if slovo == slova.reverse.first
      # pokud nenajdeme vzor tak nesklonujeme
      if slovo != slova.first && @astrtvar[0][0] == '?' && @prefrod[0] != '?'
        (1..14).each do |j|
          @astrtvar[j] = slovo
        end
      end
      15.times do |i|
        @vysledek[i] = if @vysledek[i].nil?
                         @astrtvar[i]
                       else
                         "#{@astrtvar[i]} #{@vysledek[i]}"
                       end
      end
      # puts @astrtvar.inspect
    end
  end

  def self.isshoda(vz, txt)
    txt = txt.mb_chars.downcase
    vz = vz.mb_chars.downcase
    i = vz.mb_chars.length
    j = txt.mb_chars.length

    @acmpreg = [] if @acmpreg.nil?

    return -1 if i.zero? || j.zero?

    i -= 1
    j -= 1

    while i >= 0 && j >= 0
      if vz[i] == ']'
        i -= 1
        quit = 1
        while i >= 0 && vz[i] != '['
          if vz[i] == txt[j]
            quit = 0
            @acmpreg << vz[i]
          end
          i -= 1
        end

        return -1 if quit == 1
      else
        return j + 1 if vz[i] == '-'
        return -1 if vz[i] != txt[j]
      end

      i -= 1
      j -= 1
    end
    return 0 if i.negative? && j.negative?

    return 0 if vz[i] == '-'

    -1
  end

  def self.skl2(slovo)
    @astrtvar[0] = '???'
    (1..14).each do |ii|
      @astrtvar[ii] = ''
    end

    # flgv1 = ndxv1(slovo) # je ve vyjímkách???
    flgv1 = @v1.transpose.slice(0).index(slovo)

    flgv1 = -1 if flgv1.nil?

    if flgv1 >= 0
      # pokud ano, bereme náhradu
      slovov1 = slovo
      slovo = @v1[flgv1][1]
    end

    #  if( ii>=0 )
    #  {
    #    astrTvar[1] = "v1: " + ii;
    #    SklV1( slovo, ii );
    #    return SklFmt( astrTvar );
    #    return 0;
    #  }

    slovo = xedeten(slovo)

    # Pretypovani rodu?
    if !@v10.index(slovo).nil?
      @prefrod = 'm'
    elsif !@v11.index(slovo).nil?
      @prefrod = 'ž'
    elsif !@v12.index(slovo).nil?
      @prefrod = 's'
    end

    # Nalezeni vzoru
    ii = stdndx(slovo)

    if ii.negative?
      puts 'Chyba: proto toto slovo nebyl nalezen vzor.'
      return ''
    end

    # Vlastni sklonovani
    sklstd(slovo, ii)

    return unless flgv1 >= 0

    @astrtvar[1] = slovov1 # 1.p nechame jak je
    @astrtvar[4] = @v1[flgv1][2]
  end

  def self.xedeten(txt2)
    xdetenerv = ''
    xdetenei = 0
    while xdetenei < txt2.length
      if txt2[xdetenei] == 'd' && (txt2[xdetenei + 1] == 'ě' || txt2[xdetenei + 1] == 'i')
        xdetenerv += 'ď'
        if txt2[xdetenei + 1] == 'ě'
          xdetenerv += 'e'
          xdetenei += 1
        end
      elsif txt2[xdetenei] == 't' && (txt2[xdetenei + 1] == 'ě' || txt2[xdetenei + 1] == 'i')
        xdetenerv += 'ť'
        if txt2[xdetenei + 1] == 'ě'
          xdetenerv += 'e'
          xdetenei += 1
        end
      elsif txt2[xdetenei] == 'n' && (txt2[xdetenei + 1] == 'ě' || txt2[xdetenei + 1] == 'i')
        xdetenerv += 'ň'
        if txt2[xdetenei + 1] == 'ě'
          xdetenerv += 'e'
          xdetenei += 1
        end
      else
        xdetenerv += txt2[xdetenei]
      end
      xdetenei += 1
    end

    xdetenei += 1
    xdetenerv += txt2[xdetenei] if xdetenei == txt2.length - 1

    xdetenerv
  end

  def self.xdetene(txt2)
    xdetenerv = ''
    xdetenei = 0
    while xdetenei < txt2.length
      if txt2[xdetenei] == 'ď' && (txt2[xdetenei + 1] == 'e' || txt2[xdetenei + 1] == 'i' || txt2[xdetenei + 1] == 'í')
        xdetenerv += 'd'
        if txt2[xdetenei + 1] == 'e'
          xdetenerv += 'ě'
          xdetenei += 1
        end
      elsif txt2[xdetenei] == 'ť' && (txt2[xdetenei + 1] == 'e' || txt2[xdetenei + 1] == 'i' || txt2[xdetenei + 1] == 'í')
        xdetenerv += 't'
        if txt2[xdetenei + 1] == 'e'
          xdetenerv += 'ě'
          xdetenei += 1
        end
      elsif txt2[xdetenei] == 'ň' && (txt2[xdetenei + 1] == 'e' || txt2[xdetenei + 1] == 'i' || txt2[xdetenei + 1] == 'í')
        xdetenerv += 'n'
        if txt2[xdetenei + 1] == 'e'
          xdetenerv += 'ě'
          xdetenei += 1
        end
      else
        xdetenerv += txt2[xdetenei]
      end
      xdetenei += 1
    end

    xdetenei += 1
    xdetenerv += txt2[xdetenei] if xdetenei == txt2.length - 1

    xdetenerv
  end

  def self.stdndx(slovo)
    (0...@vzor.length).each do |iii|
      # filtrace rodu
      next if @prefrod[0] != '0' && @prefrod[0] != @vzor[iii][0][0]

      break if isshoda(@vzor[iii][1], slovo) >= 0
    end

    return -1 if iii >= @vzor.length

    iii
  end

  def self.sklstd(slovo, ii)
    @astrtvar[0] = '!!!???' if ii.negative? || ii > @vzor.length

    # - seznam nedoresenych slov
    (0...@v0.length).each do |jj|
      next unless isshoda(@v0[jj], slovo) >= 0

      str = "Seznam výjimek [#{jj}]. "
      puts "#{str}Lituji, toto slovo zatím neumím správně vyskloňovat."
      return
    end

    # nastaveni rodu
    @astrtvar[0] = @vzor[ii][0]

    # vlastni sklonovani
    (1...15).each do |jj|
      @astrtvar[jj] = sklon(jj, ii, slovo)
    end

    # - seznam nepresneho sklonovani
    (0...@v3.length).each do |jj|
      if isshoda(@v3[jj], slovo) >= 0
        puts 'Pozor, v některých pádech nemusí být skloňování tohoto slova přesné.'
        return
      end
    end
  end

  def self.sklon(npad, vzndx, txt)
    return '???' if vzndx >= @vzor.length || vzndx.negative?

    txt3 = xedeten(txt)
    kndx = isshoda(@vzor[vzndx][1], txt3)
    return '???' if kndx.negative? || npad < 1 || npad > 14 # 8-14 je pro plural

    return '?' if @vzor[vzndx][npad] == '?'

    rv = if !@isdbgmode & npad == 1 # 1. pad nemenime
           xdetene(txt3)
         else
           "#{txt3[0...kndx]}-#{cmpfrm(@vzor[vzndx][npad])}"
         end

    return rv if @isdbgmode # preskoceni filtrovani

    ndx1 = rv.index('-')
    ndx1 = rv.length if ndx1.nil?

    ndx2 = rv.index('/')
    ndx2 = rv.length if ndx2.nil?

    zivotne = 1
    if ndx1 != rv.length && ndx2 != rv.length
      rv = if zivotne
             # "text-xxx/yyy" -> "textyyy"
             rv[0...ndx1] + rv[(ndx2 + 1)..]
           else
             # "text-xxx/yyy" -> "text-xxx"
             rv[0...ndx2]
           end
    end

    # vypusteni pomocnych znaku
    txt3 = ''
    (0...rv.length).each do |nnn|
      txt3 += rv[nnn] unless rv[nnn] == '-' || rv[nnn] == '/'
    end

    xdetene(txt3)

    #  return LeftStr( kndx, txt ) + vzor[vzndx][nPad];
  end

  def self.cmpfrm(txt)
    cmpfrmrv = ''
    (0...txt.length).each do |cmpfrmi|
      cmpfrmrv += case txt[cmpfrmi]
                  when '0'
                    @acmpreg[0]
                  when '1'
                    @acmpreg[1]
                  when '2'
                    @acmpreg[2]
                  else
                    txt[cmpfrmi]
                  end
    end
    cmpfrmrv
  end
end

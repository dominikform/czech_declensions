# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CzechDeclensions do
  def sklonuj(jmeno)
    (1..7).map { |pad| CzechDeclensions.sklonovani(jmeno, pad) }
  end

  # Pomocník: [tvar, rod] pro každý pád
  def pad(jmeno, cislo)
    CzechDeclensions.sklonovani(jmeno, cislo)
  end

  # ===== MUŽSKÁ JMÉNA =====

  describe 'mužská jména' do
    shared_examples 'mužské jméno' do |jmeno|
      it "#{jmeno} má rod m" do
        expect(pad(jmeno, 1)[1]).to eq('m')
      end
    end

    %w[
      Adam Aleš Alexej Alfons Alois Alojz Ambrož Anastáz Andrej Antonín Arnošt
      Bartoloměj Bedřich Benjamin Blažej Bohdan Bohumil Bohumír Bohuslav Boleslav Boris Bořek Bořivoj Bruno
      Ctibor Ctirad Cyril
      Dalibor Dan Daniel David Dominik
      Eduard Emil Erik Evžen
      Fedor Felix Filip František
      Gejza Gregor Gustav
      Hugo
      Igor Ivo Ivan
      Jakub Jan Jaromír Jaroslav Jindřich Jiří Josef Jozef Juraj Jurij
      Kamil Karel Kašpar Kazimír Kliment Konrád Konstantin Kryštof Květoslav Kvído
      Ladislav Leoš Libor Lubomír Lubor Luboš Luděk Lukáš
      Marcel Marek Martin Matěj Maximilián Metoděj Michal Miloslav Miloš Milan Miroslav
      Norbert Oldřich Ondřej Oto
      Pavel Petr Prokop
      Radim Radoslav Rastislav René Robert Robin Rostislav Rudolf Řehoř
      Slavomír Stanislav Stano Štěpán Svatopluk Svátek
      Tadeáš Teodor Tibor Tomáš Urban
      Václav Vladimír Vladan Vladislav Vlastimil Vlastislav Vojtěch
      Zdeněk Zdenko Zbyněk
    ].each { |jmeno| include_examples 'mužské jméno', jmeno }

    describe 'Adam' do
      subject { sklonuj('Adam') }
      it { expect(subject.map(&:first)).to eq(%w[Adam Adama Adamovi Adama Adame Adamovi Adamem]) }
    end

    describe 'Aleš' do
      subject { sklonuj('Aleš') }
      it { expect(subject.map(&:first)).to eq(%w[Aleš Aleše Alešovi Aleše Aleši Alešovi Alešem]) }
    end

    describe 'Alexej' do
      subject { sklonuj('Alexej') }
      it { expect(subject.map(&:first)).to eq(%w[Alexej Alexeje Alexejovi Alexeje Alexeji Alexejovi Alexejem]) }
    end

    describe 'Andrej' do
      subject { sklonuj('Andrej') }
      it { expect(subject.map(&:first)).to eq(%w[Andrej Andreje Andrejovi Andreje Andreji Andrejovi Andrejem]) }
    end

    describe 'Bartoloměj' do
      subject { sklonuj('Bartoloměj') }
      it { expect(subject.map(&:first)).to eq(%w[Bartoloměj Bartoloměje Bartolomějovi Bartoloměje Bartoloměji Bartolomějovi Bartolomějem]) }
    end

    describe 'Bedřich' do
      subject { sklonuj('Bedřich') }
      it { expect(subject.map(&:first)).to eq(%w[Bedřich Bedřicha Bedřichovi Bedřicha Bedřichu Bedřichovi Bedřichem]) }
    end

    describe 'Blažej' do
      subject { sklonuj('Blažej') }
      it { expect(subject.map(&:first)).to eq(%w[Blažej Blažeje Blažejovi Blažeje Blažeji Blažejovi Blažejem]) }
    end

    describe 'Bořivoj' do
      subject { sklonuj('Bořivoj') }
      it { expect(subject.map(&:first)).to eq(%w[Bořivoj Bořivoje Bořivojovi Bořivoje Bořivoji Bořivojovi Bořivojem]) }
    end

    describe 'Bruno' do
      subject { sklonuj('Bruno') }
      it { expect(subject.map(&:first)).to eq(%w[Bruno Bruna Brunovi Bruna Bruno Brunovi Brunem]) }
    end

    describe 'František' do
      subject { sklonuj('František') }
      it { expect(subject.map(&:first)).to eq(%w[František Františka Františkovi Františka Františku Františkovi Františkem]) }
    end

    describe 'Gejza' do
      subject { sklonuj('Gejza') }
      it { expect(subject.map(&:first)).to eq(%w[Gejza Gejzy Gejzovi Gejzu Gejzo Gejzovi Gejzou]) }
    end

    describe 'Hugo' do
      subject { sklonuj('Hugo') }
      it { expect(subject.map(&:first)).to eq(%w[Hugo Huga Hugovi Huga Hugo Hugovi Hugem]) }
    end

    describe 'Jiří' do
      subject { sklonuj('Jiří') }
      it { expect(subject.map(&:first)).to eq(%w[Jiří Jiřího Jiřímu Jiřího Jiří Jiřímu Jiřím]) }
    end

    describe 'Juraj' do
      subject { sklonuj('Juraj') }
      it { expect(subject.map(&:first)).to eq(%w[Juraj Juraje Jurajovi Juraje Juraji Jurajovi Jurajem]) }
    end

    describe 'Jurij' do
      subject { sklonuj('Jurij') }
      it { expect(subject.map(&:first)).to eq(%w[Jurij Jurije Jurijovi Jurije Juriji Jurijovi Jurijem]) }
    end

    describe 'Karel' do
      subject { sklonuj('Karel') }
      it { expect(subject.map(&:first)).to eq(%w[Karel Karla Karlovi Karla Karle Karlovi Karlem]) }
    end

    describe 'Kvído' do
      subject { sklonuj('Kvído') }
      it { expect(subject.map(&:first)).to eq(%w[Kvído Kvída Kvídovi Kvída Kvído Kvídovi Kvídem]) }
    end

    describe 'Leoš' do
      subject { sklonuj('Leoš') }
      it { expect(subject.map(&:first)).to eq(%w[Leoš Leoše Leošovi Leoše Leoši Leošovi Leošem]) }
    end

    describe 'Luboš' do
      subject { sklonuj('Luboš') }
      it { expect(subject.map(&:first)).to eq(%w[Luboš Luboše Lubošovi Luboše Luboši Lubošovi Lubošem]) }
    end

    describe 'Matěj' do
      subject { sklonuj('Matěj') }
      it { expect(subject.map(&:first)).to eq(%w[Matěj Matěje Matějovi Matěje Matěji Matějovi Matějem]) }
    end

    describe 'Metoděj' do
      subject { sklonuj('Metoděj') }
      it { expect(subject.map(&:first)).to eq(%w[Metoděj Metoděje Metodějovi Metoděje Metoději Metodějovi Metodějem]) }
    end

    describe 'Miloš' do
      subject { sklonuj('Miloš') }
      it { expect(subject.map(&:first)).to eq(%w[Miloš Miloše Milošovi Miloše Miloši Milošovi Milošem]) }
    end

    describe 'Oldřich' do
      subject { sklonuj('Oldřich') }
      it { expect(subject.map(&:first)).to eq(%w[Oldřich Oldřicha Oldřichovi Oldřicha Oldřichu Oldřichovi Oldřichem]) }
    end

    describe 'Ondřej' do
      subject { sklonuj('Ondřej') }
      it { expect(subject.map(&:first)).to eq(%w[Ondřej Ondřeje Ondřejovi Ondřeje Ondřeji Ondřejovi Ondřejem]) }
    end

    describe 'Oto' do
      subject { sklonuj('Oto') }
      it { expect(subject.map(&:first)).to eq(%w[Oto Oty Otovi Otu Oto Otovi Otou]) }
    end

    describe 'Pavel' do
      subject { sklonuj('Pavel') }
      it { expect(subject.map(&:first)).to eq(%w[Pavel Pavla Pavlovi Pavla Pavle Pavlovi Pavlem]) }
    end

    describe 'Petr' do
      subject { sklonuj('Petr') }
      it { expect(subject.map(&:first)).to eq(%w[Petr Petra Petrovi Petra Petře Petrovi Petrem]) }
    end

    describe 'René' do
      subject { sklonuj('René') }
      it { expect(subject.map(&:first)).to eq(%w[René Reného Renému Reného René Reném Reném]) }
    end

    describe 'Stano' do
      subject { sklonuj('Stano') }
      it { expect(subject.map(&:first)).to eq(%w[Stano Stana Stanovi Stana Stano Stanovi Stanem]) }
    end

    describe 'Vojtěch' do
      subject { sklonuj('Vojtěch') }
      it { expect(subject.map(&:first)).to eq(%w[Vojtěch Vojtěcha Vojtěchovi Vojtěcha Vojtěchu Vojtěchovi Vojtěchem]) }
    end

    describe 'Zdenko' do
      subject { sklonuj('Zdenko') }
      it { expect(subject.map(&:first)).to eq(%w[Zdenko Zdenka Zdenkovi Zdenka Zdenko Zdenkovi Zdenkem]) }
    end

    describe 'Zdeněk' do
      subject { sklonuj('Zdeněk') }
      it { expect(subject.map(&:first)).to eq(%w[Zdeněk Zdeňka Zdeňkovi Zdeňka Zdeňku Zdeňkovi Zdeňkem]) }
    end

    describe 'Zbyněk' do
      subject { sklonuj('Zbyněk') }
      it { expect(subject.map(&:first)).to eq(%w[Zbyněk Zbyňka Zbyňkovi Zbyňka Zbyňku Zbyňkovi Zbyňkem]) }
    end
  end

  # ===== ŽENSKÁ JMÉNA =====

  describe 'ženská jména' do
    shared_examples 'ženské jméno' do |jmeno|
      it "#{jmeno} má rod ž" do
        expect(pad(jmeno, 1)[1]).to eq('ž')
      end
    end

    %w[
      Adéla Adriana Agáta Alena Alexandra Alžběta Amálie Anastázie Andrea Anděla Aneta Anežka Anna Antonie
      Barbora Blanka Blažena Bohuslava Božena Brigita Bronislava
      Dana Daniela Diana Dominika Dorota Doubravka Drahomíra Dagmar
      Ester Eva Františka Gabriela Hana Helena
      Ivana Iveta
      Jana Jaroslava Jarmila Jindřiška Jitka Johana Julie
      Kamila Kateřina Klára Kristýna Květa Květoslava
      Lea Lenka Libuše Linda Lucie Ludmila Luďka Lukrécie Luisa
      Marcela Marie Markéta Marta Martina Michaela Miluše Miriam Monika
      Naděžda Natálie Nataša Nikola Nina Olga
      Pavla Petra Radka Renáta Romana Rozálie Růžena
      Silvie Simona Soňa Stanislava Šárka
      Taťána Tereza Vanda Veronika Věra Vladěna Vlasta
      Zdeňka Zita Zlatica Zlata Žaneta
    ].each { |jmeno| include_examples 'ženské jméno', jmeno }

    describe 'Adéla' do
      subject { sklonuj('Adéla') }
      it { expect(subject.map(&:first)).to eq(%w[Adéla Adély Adéle Adélu Adélo Adéle Adélou]) }
    end

    describe 'Amálie' do
      subject { sklonuj('Amálie') }
      it { expect(subject.map(&:first)).to eq(%w[Amálie Amálie Amálii Amálii Amálie Amálii Amálií]) }
    end

    describe 'Anna' do
      subject { sklonuj('Anna') }
      it { expect(subject.map(&:first)).to eq(%w[Anna Anny Anně Annu Anno Anně Annou]) }
    end

    describe 'Dagmar' do
      subject { sklonuj('Dagmar') }
      it { expect(subject.map(&:first)).to eq(%w[Dagmar Dagmary Dagmaře Dagmaru Dagmaro Dagmaře Dagmarou]) }
    end

    describe 'Ester' do
      subject { sklonuj('Ester') }
      it { expect(subject.map(&:first)).to eq(%w[Ester Ester Ester Ester Ester Ester Ester]) }
    end

    describe 'Eva' do
      subject { sklonuj('Eva') }
      it { expect(subject.map(&:first)).to eq(%w[Eva Evy Evě Evu Evo Evě Evou]) }
    end

    describe 'Kateřina' do
      subject { sklonuj('Kateřina') }
      it { expect(subject.map(&:first)).to eq(%w[Kateřina Kateřiny Kateřině Kateřinu Kateřino Kateřině Kateřinou]) }
    end

    describe 'Libuše' do
      subject { sklonuj('Libuše') }
      it { expect(subject.map(&:first)).to eq(%w[Libuše Libuše Libuši Libuši Libuše Libuši Libuší]) }
    end

    describe 'Marie' do
      subject { sklonuj('Marie') }
      it { expect(subject.map(&:first)).to eq(%w[Marie Marie Marii Marii Marie Marii Marií]) }
    end

    describe 'Miriam' do
      subject { sklonuj('Miriam') }
      it { expect(subject.map(&:first)).to eq(%w[Miriam Miriam Miriam Miriam Miriam Miriam Miriam]) }
    end

    describe 'Nataša' do
      subject { sklonuj('Nataša') }
      it { expect(subject.map(&:first)).to eq(%w[Nataša Nataši Nataše Natašu Natašo Nataše Natašou]) }
    end

    describe 'Olga' do
      subject { sklonuj('Olga') }
      it { expect(subject.map(&:first)).to eq(%w[Olga Olgy Olze Olgu Olgo Olze Olgou]) }
    end

    describe 'Petra' do
      subject { sklonuj('Petra') }
      it { expect(subject.map(&:first)).to eq(%w[Petra Petry Petře Petru Petro Petře Petrou]) }
    end

    describe 'Soňa' do
      subject { sklonuj('Soňa') }
      it { expect(subject.map(&:first)).to eq(%w[Soňa Soni Soně Soňu Soňo Soně Soňou]) }
    end

    describe 'Tereza' do
      subject { sklonuj('Tereza') }
      it { expect(subject.map(&:first)).to eq(%w[Tereza Terezy Tereze Terezu Terezo Tereze Terezou]) }
    end

    describe 'Věra' do
      subject { sklonuj('Věra') }
      it { expect(subject.map(&:first)).to eq(%w[Věra Věry Věře Věru Věro Věře Věrou]) }
    end

    describe 'Zlatica' do
      subject { sklonuj('Zlatica') }
      it { expect(subject.map(&:first)).to eq(%w[Zlatica Zlatici Zlatice Zlaticu Zlatico Zlatice Zlaticou]) }
    end

    describe 'Zdeňka' do
      subject { sklonuj('Zdeňka') }
      it { expect(subject.map(&:first)).to eq(%w[Zdeňka Zdeňky Zdeňce Zdeňku Zdeňko Zdeňce Zdeňkou]) }
    end
  end
end

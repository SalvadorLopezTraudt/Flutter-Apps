class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion(this.text, this.answers);

  // Shuffles answers when needed (for UI)
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

var dartQuestions = [
  QuizQuestion(
    'Wie solltest du Daten innerhalb eines StatefulWidget aktualisieren?',
    [
      'Durch Aufruf von setState()',
      'Durch Aufruf von updateData()',
      'Durch Aufruf von updateUI()',
      'Durch Aufruf von updateState()',
    ],
  ),
  QuizQuestion(
    'Was ist der Zweck des build-Ordners in einem Flutter-Projekt?',
    [
      'Er enthält automatisch generierte temporäre Daten',
      'Er enthält den Quellcode der App',
      'Er wird manuell bearbeitet und angepasst',
      'Er speichert die App-Einstellungen dauerhaft',
    ],
  ),
  QuizQuestion(
    'Wofür ist die Datei pubspec.lock in einem Flutter-Projekt zuständig?',
    [
      'Sie hält fest, welche Drittanbieter-Pakete in welcher Version installiert sind',
      'Sie wird manuell bearbeitet, um neue Pakete hinzuzufügen',
      'Sie ersetzt die pubspec.yaml Datei',
      'Sie enthält die UI-Konfiguration der App',
    ],
  ),
  QuizQuestion('Wofür werden geschweifte Klammern {} in Dart verwendet?', [
    'Zur Definition von Codeblöcken oder Sets',
    'Zum Aufrufen von Funktionen',
    'Zum Importieren von Paketen',
    'Zum Kommentieren von Code',
  ]),
  QuizQuestion('Was macht die Funktion runApp() in Flutter?', [
    'Sie startet die Ausführung der App und lädt das Widget',
    'Sie beendet die App',
    'Sie lädt externe Daten',
    'Sie definiert die Benutzeroberfläche',
  ]),
  QuizQuestion(
    'Wofür wird die Datei pubspec.yaml in einem Flutter-Projekt verwendet?',
    [
      'Zur Verwaltung von Abhängigkeiten und Einbindung von Drittanbieter-Libraries oder Frameworks',
      'Zur Speicherung von temporären Build-Daten',
      'Zum Ausführen der App',
      'Zur Definition der UI-Elemente',
    ],
  ),
  QuizQuestion(
    'Was muss getan werden, damit runApp() in Flutter ausgeführt werden kann?',
    [
      'Import von "package:flutter/material.dart" und Aufruf in der void main() Funktion',
      'Import von "dart:io" und Aufruf in der void main() Funktion',
      'Aufruf von runApp() außerhalb der main() Funktion',
      'Keine besonderen Voraussetzungen nötig',
    ],
  ),
  QuizQuestion('Was ist ein Merkmal von named parameters in Dart?', [
    'Sie stehen in geschweiften Klammern {} innerhalb von runden Klammern () und ihre Reihenfolge ist nicht wichtig',
    'Sie müssen immer in einer festen Reihenfolge übergeben werden',
    'Sie werden nur für Rückgabewerte verwendet',
    'Sie können nur in globalen Funktionen verwendet werden',
  ]),
  QuizQuestion(
    'Was passiert, wenn in Dart ein Wert mit const gespeichert wird?',
    [
      'Der Wert wird einmalig im Speicher abgelegt und bei weiteren const-Aufrufen wiederverwendet',
      'Der Wert wird bei jedem Aufruf neu im Speicher gespeichert',
      'const speichert Werte auf dem Server',
      'const verhindert, dass Werte im Speicher abgelegt werden',
    ],
  ),
  QuizQuestion(
    'Was passiert, wenn du in Flutter auf ein Widget (z.B. Text) rechtsklickst und "Refactor" auswählst?',
    [
      'Du bekommst Vorschläge, wie du das Widget umwandeln oder optimieren kannst',
      'Das Widget wird automatisch gelöscht',
      'Das Widget wird in eine Funktion umgewandelt',
      'Es öffnet sich das Widget im Design-Modus',
    ],
  ),
  QuizQuestion('Welche Rolle spielt das MaterialApp Widget in Flutter?', [
    'Es ist das Root-Widget und essentiell für den Aufbau der App',
    'Es dient nur zur Darstellung von Text',
    'Es ist ein Widget zum Speichern von Daten',
    'Es ersetzt das Scaffold Widget',
  ]),
  QuizQuestion('Wofür wird das Scaffold Widget in Flutter verwendet?', [
    'Zum Aufbau der grundlegenden Bildschirmstruktur (AppBar, Body, FloatingActionButton, etc.)',
    'Zur Verwaltung von App-Daten',
    'Zum Importieren von Paketen',
    'Zum Definieren von Animationen',
  ]),
  QuizQuestion(
    'Warum kann ein Container-Widget in Flutter nicht mit const verwendet werden?',
    [
      'Weil Container nicht konstant ist und daher nicht in einem const-eltern Widget wie MaterialApp direkt verschachtelt werden kann',
      'Weil Container immer eine StatefulWidget sein muss',
      'Weil Container nur in Funktionen verwendet werden darf',
      'Weil Container automatisch const ist und keine explizite const benötigt',
    ],
  ),
  QuizQuestion('Wie wird eine Liste in Dart definiert?', [
    'List<String> names = [\'Anna\', \'Ben\', \'Cara\'];',
    'List<String> names = {\'Anna\', \'Ben\', \'Cara\'};',
    'List<String> names = (\'Anna\', \'Ben\', \'Cara\');',
    'List<String> names = <\'Anna\', \'Ben\', \'Cara\'>;',
  ]),
  QuizQuestion('Was sind Widgets in Flutter?', [
    'Objekte bzw. Datenstrukturen im Speicher, die UI-Elemente repräsentieren',
    'Nur grafische Bilder, die angezeigt werden',
    'Funktionen zur Steuerung der App-Logik',
    'Dateien, die im Projekt gespeichert sind',
  ]),
  QuizQuestion(
    'Was passiert, wenn du in Dart nach einem Widget oder einer Methode einen Punkt (.) eingibst?',
    [
      'Es öffnet sich ein Submenu mit weiteren verfügbaren Methoden und Eigenschaften',
      'Das Programm wird automatisch kompiliert',
      'Der Code wird ausgeführt',
      'Der Editor schließt sich',
    ],
  ),
  QuizQuestion(
    'Wie kopierst du in Dart eine Liste, ohne die Original-Liste zu verändern?',
    [
      'final copiedList = List.of(originalList);',
      'final copiedList = originalList;',
      'originalList.copy();',
      'final copiedList = [...originalList.shuffle()];',
    ],
  ),
  QuizQuestion('Wie mischst du eine Liste in Dart zufällig durch?', [
    'originalList.shuffle();',
    'shuffle(originalList);',
    'originalList.randomize();',
    'List.shuffle(originalList);',
  ]),
  QuizQuestion('Was ist der Unterschied zwischen final und const in Dart?', [
    'const-Werte werden zur Compile-Zeit festgelegt, final zur Laufzeit',
    'final-Werte können mehrfach geändert werden, const nicht',
    'final-Werte sind immer null, const nicht',
    'const kann nur in Funktionen verwendet werden',
  ]),
  QuizQuestion(
    'Welche Funktion wird verwendet, um in Flutter Navigation zwischen Seiten zu ermöglichen?',
    ['Navigator.push()', 'Page.moveTo()', 'Screen.open()', 'Route.start()'],
  ),
  QuizQuestion('Was ist ein StatelessWidget in Flutter?', [
    'Ein Widget, das keine veränderlichen Zustände speichert',
    'Ein Widget mit vielen Zuständen',
    'Ein Widget, das ständig neu aufgebaut wird',
    'Ein Widget zur Verwaltung von Datenbankzuständen',
  ]),
  QuizQuestion('Wie deklarierst du eine asynchrone Funktion in Dart?', [
    'Mit dem Schlüsselwort async',
    'Mit dem Schlüsselwort wait',
    'Mit dem Schlüsselwort sync',
    'Mit dem Schlüsselwort future',
  ]),
  QuizQuestion(
    'Wie kannst du in Dart auf das erste Element einer Liste zugreifen?',
    ['myList.first', 'myList[0]', 'myList.getFirst()', 'myList.firstElement'],
  ),
  QuizQuestion('Wie überprüfst du in Dart, ob ein Wert null ist?', [
    'if (value == null)',
    'if (value.isNull)',
    'if (value.equals(null))',
    'if (value === null)',
  ]),
  QuizQuestion('Wie kannst du in Flutter Text fett darstellen?', [
    'Text("Beispiel", style: TextStyle(fontWeight: FontWeight.bold))',
    'Text("Beispiel", bold: true)',
    'Text("Beispiel", fontWeight: bold)',
    'Text("Beispiel", style: boldText)',
  ]),
  QuizQuestion('Wie führst du eine zeitverzögerte Aktion in Dart aus?', [
    'Future.delayed(Duration(seconds: 2), () { ... });',
    'Timer.wait(2, () { ... });',
    'Delay.run(2, () { ... });',
    'sleep(2);',
  ]),
  QuizQuestion('Wie kannst du ein Icon in Flutter anzeigen?', [
    'Icon(Icons.home)',
    'Display.icon("home")',
    'ShowIcon("home")',
    'HomeIconWidget()',
  ]),
  QuizQuestion('Wie gibst du in Dart etwas in der Konsole aus?', [
    'print("Hallo Welt");',
    'console.log("Hallo Welt");',
    'echo("Hallo Welt");',
    'println("Hallo Welt");',
  ]),
  QuizQuestion('Was ist der Zweck des SafeArea-Widgets in Flutter?', [
    'Es sorgt dafür, dass Inhalte nicht von Notches oder Systemleisten überlappt werden',
    'Es schützt Widgets vor unbeabsichtigter Bearbeitung',
    'Es aktiviert Sicherheitsmechanismen',
    'Es definiert geschützte Speicherbereiche',
  ]),
  QuizQuestion('Was bewirkt der Spread-Operator (...) in Dart?', [
    'Er fügt alle Elemente einer Liste in eine andere Liste ein',
    'Er löscht doppelte Werte aus einer Liste',
    'Er splittet einen String in einzelne Zeichen',
    'Er gruppiert mehrere Listen in ein Objekt',
  ]),
];

//______________________________________________________________________________
var javaQuestions = [
  QuizQuestion('Was ist das Hauptmerkmal von Java?', [
    'Plattformunabhängigkeit',
    'Prozedurale Programmierung',
    'Direkte Hardwarezugriffe',
    'Fehlende Speicherverwaltung',
  ]),
  QuizQuestion('Was bedeutet "JVM"?', [
    'Java Virtual Machine',
    'Java Visual Model',
    'Just Verified Memory',
    'Joint Variable Method',
  ]),
  QuizQuestion(
    'Welches Schlüsselwort wird verwendet, um eine Klasse in Java zu definieren?',
    ['class', 'define', 'struct', 'object'],
  ),
  QuizQuestion('Welche Methode ist der Einstiegspunkt eines Java-Programms?', [
    'main',
    'start',
    'run',
    'init',
  ]),
  QuizQuestion(
    'Wie nennt man das Konzept, wenn eine Methode in einer Unterklasse überschrieben wird?',
    [
      'Überschreibung (Overriding)',
      'Überladung (Overloading)',
      'Vererbung',
      'Kapselung',
    ],
  ),
  QuizQuestion('Welcher Datentyp speichert ganze Zahlen?', [
    'int',
    'float',
    'double',
    'char',
  ]),
  QuizQuestion('Was ist ein Konstruktor?', [
    'Eine spezielle Methode zum Erzeugen von Objekten',
    'Eine Methode zur String-Verarbeitung',
    'Ein Interface',
    'Ein Operator',
  ]),
  QuizQuestion(
    'Welche Schleife eignet sich, wenn die Anzahl der Wiederholungen vorher bekannt ist?',
    ['for', 'while', 'do-while', 'foreach'],
  ),
  QuizQuestion('Wie deklariert man ein Array in Java?', [
    'int[] zahlen = new int[5];',
    'int zahlen = [5];',
    'array<int> zahlen = 5;',
    'int zahlen() = new Array();',
  ]),
  QuizQuestion('Welche Aussage beschreibt ein Interface?', [
    'Es definiert Methoden, die implementiert werden müssen',
    'Es ist eine konkrete Klasse',
    'Es enthält nur Konstruktoren',
    'Es kann Instanzen erzeugen',
  ]),
  QuizQuestion('Was bedeutet "static" in einer Methodendeklaration?', [
    'Die Methode gehört zur Klasse, nicht zum Objekt',
    'Die Methode wird automatisch überschrieben',
    'Die Methode kann nicht geändert werden',
    'Die Methode ist privat',
  ]),
  QuizQuestion('Was ist "null" in Java?', [
    'Ein Verweis auf kein Objekt',
    'Eine Zahl',
    'Ein Schlüsselwort für 0',
    'Ein Klassenname',
  ]),
  QuizQuestion('Welcher Operator wird für Vergleiche verwendet?', [
    '==',
    '=',
    ':=',
    '===',
  ]),
  QuizQuestion('Wie kann man Exceptions behandeln?', [
    'try-catch',
    'if-else',
    'throw-return',
    'loop-handle',
  ]),
  QuizQuestion('Was ist ein Package in Java?', [
    'Eine Sammlung verwandter Klassen',
    'Ein Speicherort für Arrays',
    'Ein Interface',
    'Ein Framework',
  ]),
  QuizQuestion('Was ist Polymorphie?', [
    'Objekte können unterschiedliche Formen annehmen',
    'Verkettung von Konstruktoren',
    'Verstecken von Attributen',
    'Erstellen neuer Datentypen',
  ]),
  QuizQuestion('Was bewirkt "super"?', [
    'Ruft Methoden oder Konstruktoren der Oberklasse auf',
    'Erzeugt ein Objekt',
    'Beendet ein Programm',
    'Initialisiert Arrays',
  ]),
  QuizQuestion(
    'Welche Sichtbarkeit erlaubt Zugriff nur innerhalb der Klasse?',
    ['private', 'protected', 'public', 'static'],
  ),
  QuizQuestion('Was ist eine abstrakte Klasse?', [
    'Eine Klasse, die nicht instanziiert werden kann',
    'Eine Klasse ohne Konstruktoren',
    'Eine vollständig leere Klasse',
    'Eine Klasse mit nur statischen Methoden',
  ]),
  QuizQuestion('Was ist der Unterschied zwischen == und equals()?', [
    '== vergleicht Referenzen, equals() Inhalte',
    'Beide machen dasselbe',
    'equals() vergleicht nur primitive Typen',
    '== vergleicht Inhalte',
  ]),
  QuizQuestion('Was ist Garbage Collection?', [
    'Automatische Speicherbereinigung',
    'Fehlerprüfung im Code',
    'Kompilierung von Klassen',
    'Sicherheitsprüfung',
  ]),
  QuizQuestion('Was macht der "final" Modifier?', [
    'Verhindert Änderungen (z.B. bei Variablen, Methoden)',
    'Erlaubt keine Vererbung',
    'Erzeugt eine neue Instanz',
    'Macht den Code schneller',
  ]),
  QuizQuestion('Was ist eine Instanzvariable?', [
    'Eine Variable, die zu einem Objekt gehört',
    'Eine Variable innerhalb einer Methode',
    'Eine Konstante',
    'Eine lokale Variable',
  ]),
  QuizQuestion('Was bedeutet Overloading?', [
    'Methoden mit gleichem Namen, aber unterschiedlicher Signatur',
    'Methoden in Unterklassen überschreiben',
    'Vererbung',
    'Fehlertoleranz',
  ]),
  QuizQuestion('Wie erzeugt man ein neues Objekt?', [
    'new Klassenname()',
    'create Klasse()',
    'instanz Klasse',
    'build Klasse()',
  ]),
  QuizQuestion('Was bewirkt "this"?', [
    'Verweist auf das aktuelle Objekt',
    'Ruft die Oberklasse auf',
    'Erzeugt eine neue Klasse',
    'Beendet das Programm',
  ]),
  QuizQuestion('Welche Klassenstruktur ist korrekt?', [
    'public class Auto { }',
    'class Auto public { }',
    'Auto class public { }',
    'public Auto class { }',
  ]),
  QuizQuestion('Was ist ein Setter?', [
    'Eine Methode, um Werte zu setzen',
    'Eine Methode zum Berechnen',
    'Eine abstrakte Methode',
    'Ein Rückgabetyp',
  ]),
  QuizQuestion('Was ist ein Konstruktor-Überladen (Constructor Overloading)?', [
    'Mehrere Konstruktoren mit unterschiedlicher Parameterliste',
    'Ein Konstruktor in der Unterklasse',
    'Vererbung von Konstruktoren',
    'Abstrakte Konstruktoren',
  ]),
  QuizQuestion('Was ist der Unterschied zwischen ArrayList und LinkedList?', [
    'ArrayList ist schneller beim Zugriff, LinkedList beim Einfügen/Löschen',
    'LinkedList ist schneller bei allem',
    'ArrayList kann nur Strings speichern',
    'ArrayList speichert nur primitive Datentypen',
  ]),
];

//______________________________________________________________________________
var pythonQuestions = [
  QuizQuestion('Was ist das Ergebnis von `len("Python")`?', [
    '6',
    '5',
    '7',
    'Error',
  ]),
  QuizQuestion('Wie beginnt man eine Kommentarzeile in Python?', [
    'Mit einem #',
    'Mit //',
    'Mit <!--',
    'Mit /*',
  ]),
  QuizQuestion('Welche Datenstruktur speichert Schlüssel-Wert-Paare?', [
    'Dictionary',
    'List',
    'Tuple',
    'Set',
  ]),
  QuizQuestion('Wie definiert man eine Funktion in Python?', [
    'Mit dem Schlüsselwort `def`',
    'Mit dem Schlüsselwort `function`',
    'Mit `func`',
    'Mit `define`',
  ]),
  QuizQuestion('Wie gibt man "Hello, World!" in Python aus?', [
    'print("Hello, World!")',
    'echo("Hello, World!")',
    'console.log("Hello, World!")',
    'printf("Hello, World!")',
  ]),
  QuizQuestion('Was ist der Rückgabewert von `type(42)`?', [
    '<class \'int\'>',
    '<type \'integer\'>',
    'int',
    'number',
  ]),
  QuizQuestion(
    'Was ist der Unterschied zwischen einer Liste und einem Tupel?',
    [
      'Listen sind veränderbar, Tupel nicht',
      'Tupel sind veränderbar, Listen nicht',
      'Beide sind gleich',
      'Tupel sind schneller als Listen',
    ],
  ),
  QuizQuestion(
    'Welche Schleife wiederholt sich, solange eine Bedingung wahr ist?',
    ['while-Schleife', 'for-Schleife', 'do-while-Schleife', 'repeat-Schleife'],
  ),
  QuizQuestion('Wie importiert man ein Modul in Python?', [
    'import modulname',
    'include modulname',
    'use modulname',
    'require modulname',
  ]),
  QuizQuestion('Wie nennt man eine Funktion ohne Rückgabewert?', [
    'void-Funktion',
    'returnless',
    'procedure',
    'anonymous',
  ]),
  QuizQuestion('Wie kommentiert man mehrere Zeilen in Python aus?', [
    'Mit """ oder \'\'\'',
    'Mit //',
    'Mit <!-- -->',
    'Mit #* *#',
  ]),
  QuizQuestion('Was ist `None` in Python?', [
    'Ein spezieller Wert für "nichts"',
    'Eine Variable',
    'Ein Fehler',
    'Ein Objekt',
  ]),
  QuizQuestion('Was macht `list.append(x)`?', [
    'Fügt x am Ende der Liste hinzu',
    'Löscht x aus der Liste',
    'Fügt x am Anfang hinzu',
    'Sortiert die Liste nach x',
  ]),
  QuizQuestion('Wie überprüft man Gleichheit in einer Bedingung?', [
    'Mit ==',
    'Mit =',
    'Mit ===',
    'Mit equals()',
  ]),
  QuizQuestion('Was ist ein gültiger Variablenname in Python?', [
    'my_variable',
    '2variable',
    'my-variable',
    'my variable',
  ]),
  QuizQuestion('Was ist der Zweck von `try` und `except`?', [
    'Fehlerbehandlung',
    'Schleifensteuerung',
    'Variablendeklaration',
    'Modulimport',
  ]),
  QuizQuestion('Was gibt `bool([])` zurück?', [
    'False',
    'True',
    'None',
    'Error',
  ]),
  QuizQuestion('Was ist `range(3)` in einer Schleife?', [
    '0, 1, 2',
    '1, 2, 3',
    '1, 2',
    '0, 1, 2, 3',
  ]),
  QuizQuestion('Was macht `str.upper()`?', [
    'Gibt den Großbuchstaben-String zurück',
    'Gibt einen Kleinbuchstaben-String zurück',
    'Entfernt Leerzeichen',
    'Zählt Buchstaben',
  ]),
  QuizQuestion('Wie erstellt man eine leere Liste?', [
    '[]',
    '{}',
    '()',
    'None',
  ]),
  QuizQuestion('Was ist das Ergebnis von `3 * "a"`?', [
    '"aaa"',
    '"a3"',
    'Error',
    '"a a a"',
  ]),
  QuizQuestion('Wie überprüft man, ob ein Element in einer Liste ist?', [
    'Mit `in`',
    'Mit `has`',
    'Mit `include`',
    'Mit `contains`',
  ]),
  QuizQuestion('Wie beendet man eine Funktion vorzeitig?', [
    'Mit `return`',
    'Mit `break`',
    'Mit `stop`',
    'Mit `exit`',
  ]),
  QuizQuestion('Welche Methode konvertiert eine Zeichenkette in eine Zahl?', [
    'int()',
    'str()',
    'float()',
    'input()',
  ]),
  QuizQuestion('Was ist `elif` in Python?', [
    'Erweiterung von if-else',
    'Eine Funktion',
    'Ein Modul',
    'Ein Fehler',
  ]),
  QuizQuestion('Was gibt `type([1, 2, 3])` zurück?', [
    '<class \'list\'>',
    '<class \'array\'>',
    'list',
    'array',
  ]),
  QuizQuestion('Wie kann man mehrere Werte in einer Funktion zurückgeben?', [
    'Als Tupel',
    'Als Liste',
    'Mit return+',
    'Das geht nicht',
  ]),
  QuizQuestion('Was ist `is` in Python?', [
    'Vergleicht Identität',
    'Vergleicht Werte',
    'Importiert Module',
    'Definiert eine Klasse',
  ]),
  QuizQuestion('Wie erstellt man ein Set?', [
    'set([1, 2, 3])',
    '[1, 2, 3]',
    '{1:2, 3:4}',
    '(1, 2, 3)',
  ]),
  QuizQuestion('Was macht `zip()`?', [
    'Kombiniert Listen paarweise',
    'Komprimiert Dateien',
    'Sortiert Elemente',
    'Findet Duplikate',
  ]),
];

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de', 'fr', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
    String? frText = '',
    String? esText = '',
  }) =>
      [enText, deText, frText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'wslxcp8v': {
      'en': 'Ainzel',
      'de': 'Ainzel',
      'es': 'Ainzel',
      'fr': 'Ainzel',
    },
    'c9lj8lxg': {
      'en': 'Home',
      'de': 'Home',
      'es': 'Home',
      'fr': 'Home',
    },
    'y3kir05a': {
      'en': 'Use Cases',
      'de': 'Anwendungsfälle',
      'es': 'Casos de uso',
      'fr': 'Cas d\'utilisation',
    },
    'm28cc2gz': {
      'en': 'Industries',
      'de': 'Branchen',
      'es': 'Industrias',
      'fr': 'les industries',
    },
    'pgt5ct1f': {
      'en': 'Support',
      'de': 'Hilfe',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'o6rv7827': {
      'en': 'Company',
      'de': 'Unternehmen',
      'es': 'Compañía',
      'fr': 'Entreprise',
    },
    '1vs2ncju': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'ysecrm1l': {
      'en': 'Login',
      'de': 'Anmelden',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'y37prs25': {
      'en': 'Terms Of Service',
      'de': 'Nutzungsbedingungen',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
    },
    'znfm6igy': {
      'en': 'Privacy Statement',
      'de': 'Datenschutzerklärung',
      'es': 'Declaracion de privacidad',
      'fr': 'Déclaration de confidentialité',
    },
    'r7wbwed6': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // test
  {
    'jyfl6ccc': {
      'en': 'Page Title',
      'de': 'Seitentitel',
      'es': 'Título de la página',
      'fr': 'Titre de la page',
    },
    'q3y6bl97': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // UseCaseMenu
  {
    '2eyamphf': {
      'en': 'Company Profile',
      'de': 'Unternehmensprofil',
      'es': 'Perfil de la empresa',
      'fr': 'Profil de l\'entreprise',
    },
    '8hvjzhdu': {
      'en': 'Credit WriteUp',
      'de': 'Kreditauskunft',
      'es': 'Redacción de crédito',
      'fr': 'Rédaction de crédit',
    },
    'zzfcy0fz': {
      'en': 'Corporate Risk Report',
      'de': 'Unternehmensrisikobericht',
      'es': 'Informe de Riesgos Corporativos',
      'fr': 'Rapport sur les risques d\'entreprise',
    },
    'cgv31th5': {
      'en': 'Business Plan',
      'de': 'Geschäftsplan',
      'es': 'Plan de negocios',
      'fr': 'Plan d\'affaires',
    },
    'smujs8h2': {
      'en': 'ESG Report',
      'de': 'ESG-Bericht',
      'es': 'Informe ESG',
      'fr': 'Rapport ESG',
    },
    'u3ff1667': {
      'en': 'Custom Reports',
      'de': 'Benutzerdefinierte Berichte',
      'es': 'Reportes personalizados',
      'fr': 'Rapports personnalisés',
    },
  },
  // CompanyMenu
  {
    'y2ukfdva': {
      'en': 'About Ainzel',
      'de': 'Über Ainzel',
      'es': 'Acerca de Ainzel',
      'fr': 'À propos de Ainzel',
    },
    'ydjkkttc': {
      'en': 'Our Values',
      'de': 'Unsere Werte',
      'es': 'Nuestros valores',
      'fr': 'Nos valeurs',
    },
    'pa26guo9': {
      'en': 'Careers',
      'de': 'Karriere',
      'es': 'Carreras',
      'fr': 'Carrières',
    },
    'bhrhx7ui': {
      'en': 'News',
      'de': 'Nachricht',
      'es': 'Noticias',
      'fr': 'Nouvelles',
    },
    'w0gwc3y5': {
      'en': 'Become a Partner',
      'de': 'Ein Partner werden',
      'es': 'Convertirse en un compañero',
      'fr': 'Devenir un partenaire',
    },
  },
  // TermsOfService
  {
    '95m9pz6y': {
      'en': 'Terms Of Service',
      'de': 'Nutzungsbedingungen',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
    },
  },
  // PrivacyStatement
  {
    'wlrqzv76': {
      'en': 'Privacy Statement',
      'de': 'Datenschutzerklärung',
      'es': 'Declaracion de privacidad',
      'fr': 'Déclaration de confidentialité',
    },
    'nvwkcvia': {
      'en': 'effective as of April 02, 2024',
      'de': 'gültig ab 02.04.2024',
      'es': 'vigente a partir del 02 de abril de 2024',
      'fr': 'en vigueur à compter du 2 avril 2024',
    },
  },
  // iPhoneMenu
  {
    'n9z7zm4i': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'imqohrtz': {
      'en': 'Use Cases',
      'de': 'Anwendungsfälle',
      'es': 'Casos de uso',
      'fr': 'Cas d\'utilisation',
    },
    '6vba4j05': {
      'en': 'Industries',
      'de': 'Branchen',
      'es': 'Industrias',
      'fr': 'les industries',
    },
    'd3yk7wu6': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    '6qdagmdq': {
      'en': 'Company',
      'de': 'Unternehmen',
      'es': 'Compañía',
      'fr': 'Entreprise',
    },
    'jzqngu07': {
      'en': 'Language',
      'de': 'Sprache',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'l71nfzf8': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
  },
  // HomeMain
  {
    '4j0e9iws': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'svfri11b': {
      'en': 'Deliver Superior Business Documents \nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'sxo0u4po': {
      'en':
          'Be AI-Ready: Future-proof Your Company and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'fo28zoqc': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'c5bg36y4': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'mhielk88': {
      'en':
          'Crafting business documents without the assistance of Virtual AI Experts places your company at a considerable disadvantage, leading to costs and missed opportunities that can negatively impact performance and growth:',
      'de':
          'Das Erstellen von Geschäftsdokumenten ohne die Hilfe von Experten für virtuelle KI bringt Ihr Unternehmen in einen erheblichen Nachteil, was zu Kosten und verpassten Chancen führt, die sich negativ auf Leistung und Wachstum auswirken können:',
      'es':
          'La elaboración de documentos comerciales sin la ayuda de expertos virtuales en IA coloca a su empresa en una desventaja considerable, lo que genera costos y oportunidades perdidas que pueden afectar negativamente el rendimiento y el crecimiento:',
      'fr':
          'La création de documents commerciaux sans l\'aide d\'experts en IA virtuelle place votre entreprise dans une position considérablement désavantageuse, entraînant des coûts et des opportunités manquées qui peuvent avoir un impact négatif sur les performances et la croissance :',
    },
    'q0nb047p': {
      'en': 'Increased Time Consumption and Reduced Efficiency',
      'de': 'Erhöhter Zeitverbrauch und verringerte Effizienz',
      'es': 'Mayor consumo de tiempo y menor eficiencia',
      'fr': 'Consommation de temps accrue et efficacité réduite',
    },
    'pi4942le': {
      'en':
          'The lack of AI in document-related tasks significantly heightens time consumption for creation, editing, and formatting, while also hindering the processing, analysis, and organization of large datasets. This dual impact not only diverts valuable resources from innovative and strategic tasks but also introduces delays and inefficiencies across operations. Consequently, businesses miss out on maximizing their human capital and face potential missed opportunities due to slower operational processes.',
      'de':
          'Der Mangel an KI bei dokumentenbezogenen Aufgaben erhöht den Zeitaufwand für die Erstellung, Bearbeitung und Formatierung erheblich und behindert gleichzeitig die Verarbeitung, Analyse und Organisation großer Datensätze. Diese doppelte Auswirkung zieht nicht nur wertvolle Ressourcen von innovativen und strategischen Aufgaben ab, sondern führt auch zu Verzögerungen und Ineffizienzen im gesamten Betrieb. Folglich verpassen Unternehmen die Maximierung ihres Humankapitals und sehen sich potenziell verpassten Chancen aufgrund langsamerer Betriebsabläufe gegenüber.',
      'es':
          'La falta de IA en las tareas relacionadas con documentos aumenta significativamente el consumo de tiempo para la creación, edición y formato, al tiempo que dificulta el procesamiento, análisis y organización de grandes conjuntos de datos. Este doble impacto no sólo desvía recursos valiosos de tareas innovadoras y estratégicas, sino que también introduce retrasos e ineficiencias en todas las operaciones. En consecuencia, las empresas no logran maximizar su capital humano y enfrentan posibles oportunidades perdidas debido a procesos operativos más lentos.',
      'fr':
          'Le manque d’IA dans les tâches liées aux documents augmente considérablement le temps consacré à la création, à l’édition et au formatage, tout en entravant le traitement, l’analyse et l’organisation de grands ensembles de données. Ce double impact détourne non seulement des ressources précieuses des tâches innovantes et stratégiques, mais introduit également des retards et des inefficacités dans les opérations. Par conséquent, les entreprises ne parviennent pas à maximiser leur capital humain et sont confrontées à des opportunités potentielles manquées en raison du ralentissement des processus opérationnels.',
    },
    '6kuju7hl': {
      'en': 'Lack of Competitive Edge',
      'de': 'Mangel an Wettbewerbsvorteilen',
      'es': 'Falta de ventaja competitiva',
      'fr': 'Manque d’avantage concurrentiel',
    },
    'v8wuybgw': {
      'en':
          'Businesses that hesitate to adopt AI technology stand at a risk of lagging in the competitive landscape. Without AI, they struggle to achieve the operational efficiency and innovation speed that their AI-empowered counterparts excel at. This technological gap can lead to diminished market positioning, as companies using AI can optimize processes, enhance customer experiences, and introduce innovative products and services more swiftly. Moreover, AI adoption signals to customers, investors, and partners a commitment to leveraging cutting-edge technology for continuous improvement and sustainability. ',
      'de':
          'Unternehmen, die zögern, KI-Technologie einzuführen, laufen Gefahr, im Wettbewerb zurückzubleiben. Ohne KI haben sie Schwierigkeiten, die betriebliche Effizienz und Innovationsgeschwindigkeit zu erreichen, die ihre KI-gestützten Kollegen auszeichnen. Diese technologische Lücke kann zu einer verminderten Marktpositionierung führen, da Unternehmen, die KI nutzen, Prozesse optimieren, das Kundenerlebnis verbessern und innovative Produkte und Dienstleistungen schneller einführen können. Darüber hinaus signalisiert die Einführung von KI Kunden, Investoren und Partnern die Verpflichtung, Spitzentechnologie für kontinuierliche Verbesserung und Nachhaltigkeit zu nutzen.',
      'es':
          'Las empresas que dudan en adoptar la tecnología de IA corren el riesgo de quedarse rezagadas en el panorama competitivo. Sin IA, luchan por lograr la eficiencia operativa y la velocidad de innovación en las que sobresalen sus contrapartes potenciadas por IA. Esta brecha tecnológica puede conducir a un menor posicionamiento en el mercado, ya que las empresas que utilizan IA pueden optimizar procesos, mejorar las experiencias de los clientes e introducir productos y servicios innovadores más rápidamente. Además, la adopción de la IA indica a los clientes, inversores y socios un compromiso de aprovechar la tecnología de vanguardia para la mejora continua y la sostenibilidad.',
      'fr':
          'Les entreprises qui hésitent à adopter la technologie de l’IA risquent d’être à la traîne dans le paysage concurrentiel. Sans l’IA, elles ont du mal à atteindre l’efficacité opérationnelle et la vitesse d’innovation dans lesquelles excellent leurs homologues dotés de l’IA. Ce fossé technologique peut entraîner une diminution de leur positionnement sur le marché, dans la mesure où les entreprises utilisant l’IA peuvent optimiser leurs processus, améliorer l’expérience client et introduire plus rapidement des produits et services innovants. De plus, l’adoption de l’IA signale aux clients, aux investisseurs et aux partenaires leur engagement à tirer parti des technologies de pointe pour une amélioration continue et une durabilité accrue.',
    },
    'm6z0oqls': {
      'en': 'Delayed Insights and Decision Making',
      'de': 'Verzögerte Erkenntnisse und Entscheidungsfindung',
      'es': 'Conocimientos y toma de decisiones retrasados',
      'fr': 'Informations et prise de décision retardées',
    },
    '1p8gyzvn': {
      'en':
          'The absence of AI in the analysis of business documents considerably hampers the extraction of actionable insights, leading to delays in decision-making and a reduction in strategic agility. AI\'s unparalleled ability to process vast volumes of data and perform complex analyses swiftly is fundamental for obtaining timely, informed insights essential for making strategic choices. This rapid access to insights is crucial for businesses aiming to quickly adapt to market changes, seize opportunities, and maintain a competitive edge in the fast-paced business environment.',
      'de':
          'Das Fehlen von KI bei der Analyse von Geschäftsdokumenten erschwert die Gewinnung umsetzbarer Erkenntnisse erheblich, was zu Verzögerungen bei der Entscheidungsfindung und einer Verringerung der strategischen Agilität führt. Die beispiellose Fähigkeit der KI, riesige Datenmengen zu verarbeiten und komplexe Analysen schnell durchzuführen, ist von grundlegender Bedeutung für die Gewinnung zeitnaher, fundierter Erkenntnisse, die für strategische Entscheidungen unerlässlich sind. Dieser schnelle Zugriff auf Erkenntnisse ist für Unternehmen von entscheidender Bedeutung, die sich schnell an Marktveränderungen anpassen, Chancen nutzen und im schnelllebigen Geschäftsumfeld einen Wettbewerbsvorteil wahren wollen.',
      'es':
          'La ausencia de IA en el análisis de documentos comerciales dificulta considerablemente la extracción de conocimientos procesables, lo que provoca retrasos en la toma de decisiones y una reducción de la agilidad estratégica. La capacidad incomparable de la IA para procesar grandes volúmenes de datos y realizar análisis complejos rápidamente es fundamental para obtener información oportuna e informada, esencial para tomar decisiones estratégicas. Este rápido acceso a conocimientos es crucial para las empresas que buscan adaptarse rápidamente a los cambios del mercado, aprovechar oportunidades y mantener una ventaja competitiva en el entorno empresarial acelerado.',
      'fr':
          'L’absence d’IA dans l’analyse des documents commerciaux entrave considérablement l’extraction d’informations exploitables, entraînant des retards dans la prise de décision et une réduction de l’agilité stratégique. La capacité inégalée de l\'IA à traiter de vastes volumes de données et à effectuer rapidement des analyses complexes est fondamentale pour obtenir des informations opportunes et éclairées, essentielles à la prise de décisions stratégiques. Cet accès rapide aux informations est crucial pour les entreprises qui souhaitent s\'adapter rapidement aux changements du marché, saisir les opportunités et conserver un avantage concurrentiel dans un environnement commercial en évolution rapide.',
    },
    'xe40xm2m': {
      'en': 'Lost Chances for Better Customer Bonds and Personalization',
      'de': 'Verpasste Chancen für bessere Kundenbindung und Personalisierung',
      'es':
          'Oportunidades perdidas para mejorar los vínculos con los clientes y la personalización',
      'fr':
          'Chances perdues pour de meilleurs liens clients et une meilleure personnalisation',
    },
    'lxmelfq6': {
      'en':
          'Failing to utilize AI for personalization means missing out on key opportunities to tailor documents and interactions to individual customer preferences, a vital strategy for enhancing engagement and service. This oversight limits the ability to strengthen customer relationships and deliver faster, more effective service. AI-driven personalization provides a competitive edge by enabling businesses to anticipate and meet customer needs with unparalleled precision and speed.',
      'de':
          'Wenn KI nicht für die Personalisierung genutzt wird, werden wichtige Möglichkeiten zur Anpassung von Dokumenten und Interaktionen an individuelle Kundenpräferenzen verpasst – eine wichtige Strategie zur Verbesserung von Engagement und Service. Dieses Versehen schränkt die Fähigkeit ein, Kundenbeziehungen zu stärken und einen schnelleren und effektiveren Service zu bieten. KI-gesteuerte Personalisierung verschafft Unternehmen einen Wettbewerbsvorteil, indem sie es ihnen ermöglicht, Kundenbedürfnisse mit beispielloser Präzision und Geschwindigkeit zu antizipieren und zu erfüllen.',
      'es':
          'No utilizar la IA para la personalización significa perder oportunidades clave para adaptar documentos e interacciones a las preferencias individuales de los clientes, una estrategia vital para mejorar el compromiso y el servicio. Esta supervisión limita la capacidad de fortalecer las relaciones con los clientes y ofrecer un servicio más rápido y eficaz. La personalización impulsada por la IA proporciona una ventaja competitiva al permitir a las empresas anticipar y satisfacer las necesidades de los clientes con una precisión y velocidad incomparables.',
      'fr':
          'Ne pas utiliser l’IA pour la personnalisation signifie manquer des opportunités clés pour adapter les documents et les interactions aux préférences individuelles des clients, une stratégie vitale pour améliorer l’engagement et le service. Cette surveillance limite la capacité à renforcer les relations avec les clients et à fournir un service plus rapide et plus efficace. La personnalisation basée sur l\'IA offre un avantage concurrentiel en permettant aux entreprises d\'anticiper et de répondre aux besoins des clients avec une précision et une rapidité inégalées.',
    },
    'mvbo5vry': {
      'en': 'Costs of Compliance and Risk Management',
      'de': 'Kosten für Compliance und Risikomanagement',
      'es': 'Costos de cumplimiento y gestión de riesgos',
      'fr': 'Coûts de conformité et de gestion des risques',
    },
    '2ctzsthe': {
      'en':
          'The absence of AI in compliance and risk management exposes businesses to increased non-compliance risks, including fines and reputational damage. AI significantly aids in aligning documents with relevant laws and regulations, minimizing the likelihood of such risks. Without AI, companies jeopardize their integrity and face potential regulatory penalties, underscoring the importance of AI for efficient compliance processes and safeguarding reputation.',
      'de':
          'Das Fehlen von KI im Compliance- und Risikomanagement setzt Unternehmen einem erhöhten Risiko der Nichteinhaltung aus, einschließlich Bußgeldern und Reputationsschäden. KI trägt erheblich dazu bei, Dokumente an relevante Gesetze und Vorschriften anzupassen und so die Wahrscheinlichkeit solcher Risiken zu minimieren. Ohne KI gefährden Unternehmen ihre Integrität und müssen mit potenziellen behördlichen Strafen rechnen. Dies unterstreicht die Bedeutung von KI für effiziente Compliance-Prozesse und den Schutz der Reputation.',
      'es':
          'La ausencia de IA en el cumplimiento y la gestión de riesgos expone a las empresas a mayores riesgos de incumplimiento, incluidas multas y daños a la reputación. La IA ayuda significativamente a alinear los documentos con las leyes y regulaciones relevantes, minimizando la probabilidad de tales riesgos. Sin IA, las empresas ponen en peligro su integridad y enfrentan posibles sanciones regulatorias, lo que subraya la importancia de la IA para procesos de cumplimiento eficientes y salvaguardar la reputación.',
      'fr':
          'L’absence d’IA dans la conformité et la gestion des risques expose les entreprises à des risques accrus de non-conformité, notamment des amendes et des atteintes à leur réputation. L’IA aide considérablement à aligner les documents sur les lois et réglementations pertinentes, minimisant ainsi la probabilité de tels risques. Sans IA, les entreprises mettent en péril leur intégrité et s’exposent à d’éventuelles sanctions réglementaires, ce qui souligne l’importance de l’IA pour des processus de conformité efficaces et pour préserver leur réputation.',
    },
    'tndtqx21': {
      'en': 'Lost Innovation Opportunities Without AI Expertise',
      'de': 'Verlorene Innovationsmöglichkeiten ohne KI-Expertise',
      'es': 'Oportunidades de innovación perdidas sin experiencia en IA',
      'fr': 'Opportunités d’innovation perdues sans expertise en IA',
    },
    'jbbdnzze': {
      'en':
          'Companies cannot house experts for every field, but leveraging Virtual AI Experts offers them an invaluable opportunity to access a broad spectrum of expertise. These AI systems offer more than just operational efficiency; they are a source of continuous innovation, capable of identifying trends, generating ideas, suggesting improvements, and unlocking new possibilities. Without leveraging this intelligence, companies remain stagnant, overlooking the potential to revolutionize their products, services, and processes. ',
      'de':
          'Unternehmen können nicht für jedes Fachgebiet Experten unterbringen, aber der Einsatz von Virtual AI Experts bietet ihnen eine unschätzbare Gelegenheit, auf ein breites Spektrum an Fachwissen zuzugreifen. Diese KI-Systeme bieten mehr als nur betriebliche Effizienz; Sie sind eine Quelle kontinuierlicher Innovation, die in der Lage ist, Trends zu erkennen, Ideen zu generieren, Verbesserungen vorzuschlagen und neue Möglichkeiten zu erschließen. Ohne die Nutzung dieser Informationen bleiben Unternehmen stagnieren und übersehen das Potenzial, ihre Produkte, Dienstleistungen und Prozesse zu revolutionieren.',
      'es':
          'Las empresas no pueden albergar expertos para todos los campos, pero aprovechar Virtual AI Experts les ofrece una oportunidad invaluable de acceder a un amplio espectro de experiencia. Estos sistemas de IA ofrecen más que solo eficiencia operativa; son una fuente de innovación continua, capaz de identificar tendencias, generar ideas, sugerir mejoras y desbloquear nuevas posibilidades. Sin aprovechar esta inteligencia, las empresas permanecen estancadas y pasan por alto el potencial de revolucionar sus productos, servicios y procesos.',
      'fr':
          'Les entreprises ne peuvent pas héberger des experts pour chaque domaine, mais tirer parti des experts virtuels en IA leur offre une opportunité inestimable d’accéder à un large spectre d’expertise. Ces systèmes d’IA offrent bien plus qu’une simple efficacité opérationnelle ; ils sont une source d\'innovation continue, capables d\'identifier les tendances, de générer des idées, de suggérer des améliorations et d\'ouvrir de nouvelles possibilités. Sans tirer parti de cette intelligence, les entreprises stagnent, négligeant le potentiel de révolutionner leurs produits, services et processus.',
    },
    '2ltb855z': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'zdg6uh3x': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'qeg8ivkj': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '8krex3i3': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'bi4qb4kh': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'ui9neaf3': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    '037hmau2': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'qtp88r33': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'qof0lqsk': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'xiixz8uk': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'dhqwmgs6': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '107zm8ar': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'xvs72fi8': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'c4fesejr': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'xoifcdm4': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'zqxotty4': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    '488d9cex': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'wyx5rr7z': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'k9n2c4h2': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeBanking
  {
    'kq3kiwse': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'optiw7rw': {
      'en': 'Create Superior Credit Write-Ups\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'jykb327r': {
      'en': 'Be AI-Ready: Future-proof Your Financial Institution ',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'bh67cgpe': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    '3odl86ia': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'v34b2ubp': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '2vsv7fk7': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'bbnsc6lc': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'i2ptwzr8': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'u0y6xvz5': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    '21tefpff': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    '2ly939qu': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'ssaf7edl': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'a6gfvxns': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    '3rfbqbjr': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'u2rh1ssf': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'tetse5i2': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'kl4macvo': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'vromudq2': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'nx4wsvfy': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'dtqmm529': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '7oq64lfi': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'vsx3eaci': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'yvldxo9o': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'r00i9c1l': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeHighTech
  {
    'pine9azm': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'g5cl8aws': {
      'en': 'Create Superior ESG Reports\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'vnpxhu4i': {
      'en': 'Be AI-Ready: Future-proof Your HighTech Company',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    '0qmgtqv7': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'z2flr7zs': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'k14kn0sr': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'kncg08yz': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'bg7i0brt': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'zaeqynmr': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '8u7fmnkr': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    '5ghxheil': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    '7iv15tr8': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    '0xsu02my': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'nijhpijn': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    '6yntpbg0': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'zpdo87vp': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'y1pu5d4n': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'kxomjz5v': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'quumwh6l': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'i3i9fxvh': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'hp6w6acn': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '03pdrp3z': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'xgdkai0q': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'pwyakm8y': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'v904narx': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomePharma
  {
    'dyvn6v9a': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '2c89d4ac': {
      'en':
          'Create Superior Intellectual Property Agreements\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'rvyrt10d': {
      'en': 'Be AI-Ready: Future-proof Your Pharma Company',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'twnpydaq': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'giiak1oq': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    '5v661o1i': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'b3vzlquf': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'kecphc5m': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'kwg9o7od': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'sskk7cgz': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'gys3b5p2': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'lb8qe8bz': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    '4ee2oa5n': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'qt365ro9': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'xjodb511': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    '32069dhx': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'f8m9c01e': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'fwt95uvs': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'bftnaxmg': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'ql0gv5ce': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'xz9rl47g': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '46joll4e': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'vzht76tf': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'uejl5cqy': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'ia82ggzd': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeProfessionalServices
  {
    '2lp4spfh': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'c648le36': {
      'en': 'Create Superior Business Plans\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'p6wu1yo0': {
      'en': 'Be AI-Ready: Future-proof Your Professional Services Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    '4ojymnhr': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'onctxegz': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    '21bmo45f': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'b9x7bua4': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'kbh82kdn': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'soey4rp9': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '2fdg2cl7': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'c4yv25zo': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'az5w7kqn': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'qo9ylmp7': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'v35d1ep0': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'qn8mwflh': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'tev30d2a': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'u09f9olb': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '0d6kf2ur': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'l9ckdsn6': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'k84cdzzm': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'ajpx31rz': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'ihh4bc6m': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    '76aeex0k': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    '06b7s2zt': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'lci2068v': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomePublicSector
  {
    'khk2e36j': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '9ddzq6p2': {
      'en':
          'Create Superior Building Permit Evaluations\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '6imq5fjm': {
      'en': 'Be AI-Ready: Future-proof Your Regulatory Authority',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'xosbq160': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'ws4z7mh3': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'tqxqgklp': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '4sg9npgz': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'd443596b': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'lfydlsqx': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'ik4s6j4w': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'tumgrbg7': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'hvuvpz9v': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    's7c77udt': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'xjvposu3': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'n6ypsq2v': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    '1xp2rkek': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'dsc0eoto': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '0p4tyj1t': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'q6szi3q1': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    '8vjyudsj': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    '86n2zehh': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '4lx59m8h': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'skmrng6b': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'y9zk71bq': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'ty8qpsrf': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeCompanyProfile
  {
    'u42195k1': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'hzpbskxq': {
      'en': 'Create Superior Company Profiles\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'ij1s69qg': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'ej8m96ek': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'komj3cv9': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'p8s84apu': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'yjt8ly94': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'e10q4ku6': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '32byvayg': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    '9xf3j01r': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'hh2h6gsu': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    '37oyer78': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'ddj0qezw': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'qga08w5a': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'tiep1b2d': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'chyz4y43': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'oyp3zs0j': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'tdehc0c1': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'tdkgvloh': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'nrr6uebr': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '60sps4ap': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'mgr3suwi': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    '72ovdqse': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'ffqzca2m': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeCreditWriteUp
  {
    'vl11u7mw': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'oolg4iw9': {
      'en': 'Create Superior Credit Write-Ups\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    'h68tsbkt': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'eetytcrb': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'ltv5eiu5': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'wqjs5wkr': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'rv1ducr7': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    '88terbjo': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'y4ekzhcw': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'mu36u50u': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'g7096cq5': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'ufotl15g': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'dwkqovr0': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    '54zbixze': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'dn1cjcli': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'f8meqabt': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'lrlmzljo': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'tntv9v57': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'cwy0xdcx': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'nnxmz4iu': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'ouuqs11p': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'tq7u5xgj': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'z7bmfeyy': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    '4ge5tvc7': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'jcga6aoi': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeCorporateRiskReport
  {
    'ox0upda2': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'rukvmchj': {
      'en': 'Create Superior Corporate Risk Reports\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '8nrkuux5': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'cph8ecti': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'uf7cb8wu': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'pch5yrj4': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '1xe0x21k': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'xby03k36': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    's995r80z': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '5pl544nu': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'i7g8fdse': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'fdot8vvj': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'e976273o': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'dajwym7l': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'mq89iikf': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'r8jggvuy': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'w13obxws': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'q7g7qo64': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'katb4k38': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'vnaca5yi': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'aqg2usnz': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    '3052lsuk': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'xdj6ibns': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'rnuplfis': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'rw9ibtqh': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeBusinessPlan
  {
    'mtgqxtmz': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'gk6mo0jo': {
      'en': 'Create Superior Business Plans\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '2q5tjlim': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'jcgmsdyf': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'd7e3tszh': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    '1ajq5z0u': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'xkead5mz': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    '2hwqj1z6': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'vn5kmpp8': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen es Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'jpugzy12': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'qchviguc': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    '0t838cvz': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'qt1zfps5': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'esmjhwm1': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'nzfty6kl': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'juno05vy': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'kllk6dkc': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'ylkpykmo': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'fven6fog': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'riaupacf': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'soqn5x8s': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'l7zzxs5e': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'rte1h7xt': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'kj4zegbz': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    '9i9tq58w': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeESGReport
  {
    'r90r79wl': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'lo6gv39u': {
      'en': 'Create Superior ESG Reports\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '92dtg0xn': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    '9s2114ut': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'p8fb7exm': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'v5juzws3': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'u5njfp5x': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'isfscsmo': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'mh31sqzh': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '9us7h5ln': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'lgeghohb': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'dz2j2v6p': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    '91t12ozh': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'q7t9ezx1': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'q62tvfah': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    '7tkp8j84': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    '28m4309x': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '7sv9as62': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'm2irzj9j': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'ppdx9mb7': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'h2s5rerz': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'uboqd862': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'ztau1m5t': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'qyv896ya': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'eft290i2': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeCustomReport
  {
    '4dsw8v25': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    'ezm9d7lw': {
      'en': 'Create Custom Documents\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '3m7luyst': {
      'en': 'Be AI-Ready: Future-proof Your Organization',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'wwi78vsi': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'joqb1gd8': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'j54840ll': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '6f6w63uj': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'olljyuz1': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'n1y7j05l': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'n466w1et': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    '3y2drpsa': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    '3b0i8fkz': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'ic1ww2r1': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    '5fxo6t2h': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    '17y6hf8g': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'y9vq8zgj': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    '1miqwxb2': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '5kfh9zzt': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'gaqh7992': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinausgeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'd0jh0eoo': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'pb6yjlvi': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'y1pev4qy': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'n9sdsmb7': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    '9awu8tk4': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'g0dzzzwp': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // HomeAboutAinzel
  {
    'fyt3ycfh': {
      'en': 'About Ainzel: \nSupercharging Organizations With AI',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '9ar77ww9': {
      'en':
          'Ainzel is energized by the target of delivering 100 million hours of AI-Expert assistance by 2025, ensuring that intellectual resources never hinder a business from pursuing its aspirations.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    '3sqv4ike': {
      'en':
          '\"Ainzel brings together human creativity and artificial intelligence, creating a space where both offer creativity and expertise. This partnership propels industries forward, enriching human efforts with precision and strategic intuition to enhance performance and personalized customer engagement. Committed to ethical AI, we prioritize privacy, security, and trust, aiming to empower businesses to overcome challenges and achieve success. Our vision blends human ingenuity with technological capabilities, paving the way for a future filled with limitless possibilities and remarkable achievements.\"',
      'de':
          '„Ainzel vereint menschliche Kreativität und künstliche Intelligenz und schafft so einen Raum, in dem beide Kreativität und Fachwissen bieten. Diese Partnerschaft treibt Branchen voran und bereichert menschliche Bemühungen mit Präzision und strategischer Intuition, um die Leistung und die personalisierte Kundenbindung zu verbessern. Wir sind der ethischen KI verpflichtet und legen Wert auf Privatsphäre.“ , Sicherheit und Vertrauen, mit dem Ziel, Unternehmen in die Lage zu versetzen, Herausforderungen zu meistern und Erfolg zu haben. Unsere Vision verbindet menschlichen Einfallsreichtum mit technologischen Fähigkeiten und ebnet den Weg für eine Zukunft voller grenzenloser Möglichkeiten und bemerkenswerter Erfolge.',
      'es':
          '\"Ainzel reúne la creatividad humana y la inteligencia artificial, creando un espacio donde ambas ofrecen creatividad y experiencia. Esta asociación impulsa a las industrias hacia adelante, enriqueciendo los esfuerzos humanos con precisión e intuición estratégica para mejorar el rendimiento y la participación personalizada del cliente. Comprometidos con la IA ética, priorizamos la privacidad \", seguridad y confianza, con el objetivo de capacitar a las empresas para superar los desafíos y lograr el éxito. Nuestra visión combina el ingenio humano con las capacidades tecnológicas, allanando el camino para un futuro lleno de posibilidades ilimitadas y logros notables\".',
      'fr':
          '\"Ainzel rassemble la créativité humaine et l\'intelligence artificielle, créant un espace où les deux offrent créativité et expertise. Ce partenariat propulse les industries vers l\'avant, enrichissant les efforts humains avec précision et intuition stratégique pour améliorer les performances et l\'engagement personnalisé des clients. Engagés en faveur d\'une IA éthique, nous accordons la priorité à la confidentialité. , la sécurité et la confiance, dans le but de permettre aux entreprises de surmonter les défis et de réussir. Notre vision allie l\'ingéniosité humaine aux capacités technologiques, ouvrant la voie à un avenir rempli de possibilités illimitées et de réalisations remarquables.',
    },
    'ezuq9yyo': {
      'en': 'Bernhard Ritz, Founder & CEO',
      'de': 'Bernhard Ritz, Gründer und CEO',
      'es': 'Bernhard Ritz, fundador y director ejecutivo',
      'fr': 'Bernhard Ritz, fondateur et PDG',
    },
    '3upjik1s': {
      'en': 'On a mission to deliver ',
      'de': 'On a mission to deliver ',
      'es': 'On a mission to deliver ',
      'fr': 'On a mission to deliver ',
    },
    'x1wgfeoo': {
      'en': '100 million hours of AI-Powered Assistance  ',
      'de': '100 million hours of AI-Powered Assistance  ',
      'es': '100 million hours of AI-Powered Assistance  ',
      'fr': '100 million hours of AI-Powered Assistance  ',
    },
    'y4d5mabk': {
      'en': 'by 2025.',
      'de': 'by 2025.',
      'es': 'by 2025.',
      'fr': 'by 2025.',
    },
    'azwzyq47': {
      'en': 'GET STARTED...TODAY!',
      'de': 'Fangen Sie an... HEUTE!',
      'es': '¡EMPIECE HOY!',
      'fr': 'COMMENCER AUJOURD\'HUI!',
    },
    'lrdb0nfr': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
  },
  // iPhoneMenuUseCase
  {
    '6ifche92': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'h7e2b1dv': {
      'en': 'Use Cases',
      'de': 'Anwendungsfälle',
      'es': 'Casos de uso',
      'fr': 'Cas d\'utilisation',
    },
    'n5jq2nq0': {
      'en': 'Industries',
      'de': 'Branchen',
      'es': 'Industrias',
      'fr': 'les industries',
    },
    'gfea77cx': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'xgoadd70': {
      'en': 'Company',
      'de': 'Unternehmen',
      'es': 'Compañía',
      'fr': 'Entreprise',
    },
    'xa6wjzn1': {
      'en': 'Language',
      'de': 'Sprache',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'uy9pmw7y': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
  },
  // iPhoneMenuIndustries
  {
    'lk4yrofv': {
      'en': 'Banking',
      'de': 'Bankwesen',
      'es': 'Bancario',
      'fr': 'Bancaire',
    },
    'g7ajjcvs': {
      'en': 'HighTech',
      'de': 'Hightech',
      'es': 'Alta tecnología',
      'fr': 'Technologie de pointe',
    },
    'mlw4itun': {
      'en': 'Pharma',
      'de': 'Pharma',
      'es': 'Farmacéutica',
      'fr': 'Pharmaceutique',
    },
    'llc33is9': {
      'en': 'Professional Services',
      'de': 'Professionelle Dienste',
      'es': 'Servicios profesionales',
      'fr': 'Services professionnels',
    },
    'mjhp219t': {
      'en': 'Public Sector',
      'de': 'Öffentlicher Sektor',
      'es': 'Sector público',
      'fr': 'Secteur public',
    },
  },
  // IndustryMenu
  {
    'vik8yljz': {
      'en': 'Banking',
      'de': 'Bankwesen',
      'es': 'Bancario',
      'fr': 'Bancaire',
    },
    'rgi92if4': {
      'en': 'HighTech',
      'de': 'Hightech',
      'es': 'Alta tecnología',
      'fr': 'Technologie de pointe',
    },
    'z2y1ocyi': {
      'en': 'Pharma',
      'de': 'Pharma',
      'es': 'Farmacéutica',
      'fr': 'Pharmaceutique',
    },
    'oagiedea': {
      'en': 'Professional Services',
      'de': 'Professionelle Dienste',
      'es': 'Servicios profesionales',
      'fr': 'Services professionnels',
    },
    '4eo8v9e6': {
      'en': 'Public Sector',
      'de': 'Öffentlicher Sektor',
      'es': 'Sector público',
      'fr': 'Secteur public',
    },
  },
  // SupportMenu
  {
    'k888snql': {
      'en': 'Help',
      'de': 'Helfen',
      'es': 'Ayuda',
      'fr': 'Aide',
    },
    'ifq7fdrz': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
  },
  // HomeHelp
  {
    '03dmg4fc': {
      'en': 'How can we help?',
      'de': 'Wie können wir helfen?',
      'es': '¿Cómo podemos ayudar?',
      'fr': 'Comment pouvons nous aider?',
    },
    'f4dlddng': {
      'en': 'We are here to help you \nwith any of your needs.',
      'de': 'Wir sind hier, um Ihnen \nbei allen Ihren Bedürfnissen zu helfen.',
      'es': 'Estamos aquí para ayudarle \ncon cualquiera de sus necesidades.',
      'fr': 'Nous sommes là pour vous aider \navec tous vos besoins.',
    },
    'byh6bsz6': {
      'en': 'Search ...',
      'de': 'Suchen ...',
      'es': 'Buscar ...',
      'fr': 'Recherche ...',
    },
    'w0qwdg8c': {
      'en': 'Please log in to contact support',
      'de': 'Bitte melden Sie sich an, um den Support zu kontaktieren',
      'es': 'Por favor inicia sesión para contactar con soporte',
      'fr': 'Veuillez vous connecter pour contacter le support',
    },
    'ivnosdxr': {
      'en': 'Send us an email at info@ainzel.com',
      'de': 'Senden Sie uns eine E-Mail an info@ainzel.com',
      'es': 'Envíanos un correo electrónico a info@ainzel.com',
      'fr': 'Envoyez-nous un email à info@ainzel.com',
    },
    'lz9cbpjm': {
      'en': 'Call us or text us at +1 (484) 744-1324',
      'de':
          'Rufen Sie uns an oder schreiben Sie uns eine SMS unter +1 (484) 744-1324',
      'es': 'Llámanos o envíanos un mensaje de texto al +1 (484) 744-1324',
      'fr': 'Appelez-nous ou envoyez-nous un SMS au +1 (484) 744-1324',
    },
    '6mro4bss': {
      'en': 'Visit us on LinkedIn at /company/ainzel',
      'de': 'Besuchen Sie uns auf LinkedIn unter /company/ainzel',
      'es': 'Visítenos en LinkedIn en /empresa/ainzel',
      'fr': 'Visitez-nous sur LinkedIn à /company/ainzel',
    },
  },
  // HomeContactUs
  {
    'zv1yee36': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'e93cingv': {
      'en': 'We are here to answer your question.',
      'de': 'Wir sind hier, um Ihre Frage zu beantworten.',
      'es': 'Estamos aquí para responder a su pregunta.',
      'fr': 'Nous sommes là pour répondre à votre question.',
    },
    'fm8k8c4v': {
      'en': 'Send us an email at info@ainzel.com',
      'de': 'Senden Sie uns eine E-Mail an info@ainzel.com',
      'es': 'Envíanos un correo electrónico a info@ainzel.com',
      'fr': 'Envoyez-nous un email à info@ainzel.com',
    },
    'torvtqll': {
      'en': 'Call us or text us at +1 (484) 744-1324',
      'de':
          'Rufen Sie uns an oder schreiben Sie uns eine SMS unter +1 (484) 744-1324',
      'es': 'Llámanos o envíanos un mensaje de texto al +1 (484) 744-1324',
      'fr': 'Appelez-nous ou envoyez-nous un SMS au +1 (484) 744-1324',
    },
    'k6ed0aux': {
      'en': 'Visit us on LinkedIn at /company/ainzel',
      'de': 'Besuchen Sie uns auf LinkedIn unter /company/ainzel',
      'es': 'Visítenos en LinkedIn en /empresa/ainzel',
      'fr': 'Visitez-nous sur LinkedIn à /company/ainzel',
    },
  },
  // HomeMain2
  {
    '6ws06cug': {
      'en':
          'Be AI-Ready: Future-proof Your Company and Unlock Emerging Opportunities.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '9mn3e48u': {
      'en':
          'Deliver superior business content with an orchestra of AI-powered virtual assistants',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'p71zxrrl': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'r10mc3e0': {
      'en':
          'Crafting business documents without the assistance of Virtual AI Experts places your company at a considerable disadvantage, leading to costs and missed opportunities that can negatively impact performance and growth.',
      'de':
          'Das Erstellen von Geschäftsdokumenten ohne die Unterstützung von Experten für virtuelle KI bringt Ihr Unternehmen in einen erheblichen Nachteil, was zu Kosten und verpassten Chancen führt, die sich negativ auf Leistung und Wachstum auswirken können.',
      'es':
          'La elaboración de documentos comerciales sin la ayuda de expertos en IA virtual coloca a su empresa en una desventaja considerable, lo que genera costos y oportunidades perdidas que pueden afectar negativamente el rendimiento y el crecimiento.',
      'fr':
          'La création de documents commerciaux sans l\'aide d\'experts en IA virtuelle place votre entreprise dans une position considérablement désavantageuse, entraînant des coûts et des opportunités manquées qui peuvent avoir un impact négatif sur les performances et la croissance.',
    },
    'a29i9lyw': {
      'en': 'Increased Time Consumption and Reduced Efficiency',
      'de': 'Erhöhter Zeitverbrauch und verringerte Effizienz',
      'es': 'Mayor consumo de tiempo y menor eficiencia',
      'fr': 'Consommation de temps accrue et efficacité réduite',
    },
    'ghxtd5b0': {
      'en':
          'AI\'s absence in document tasks increases time spent on creation, editing, and data management, diverting resources from innovation and causing operational delays, leading to missed opportunities.',
      'de':
          'Das Fehlen von KI bei Dokumentenaufgaben erhöht den Zeitaufwand für die Erstellung, Bearbeitung und Datenverwaltung, lenkt Ressourcen von Innovationen ab und führt zu betrieblichen Verzögerungen, was zu verpassten Chancen führt.',
      'es':
          'La ausencia de la IA en las tareas documentales aumenta el tiempo dedicado a la creación, edición y gestión de datos, desviando recursos de la innovación y provocando retrasos operativos, lo que lleva a la pérdida de oportunidades.',
      'fr':
          'L\'absence de l\'IA dans les tâches documentaires augmente le temps consacré à la création, à l\'édition et à la gestion des données, détournant les ressources de l\'innovation et provoquant des retards opérationnels, conduisant à des opportunités manquées.',
    },
    'c2jskkz9': {
      'en': 'Lack of Competitive Edge',
      'de': 'Mangel an Wettbewerbsvorteilen',
      'es': 'Falta de ventaja competitiva',
      'fr': 'Manque d’avantage concurrentiel',
    },
    'txncb38i': {
      'en':
          'Hesitating to adopt AI can cause businesses to fall behind, as they lack the efficiency and innovation speed of AI-enabled competitors, affecting market position and signaling a reluctance to embrace technology for improvement.',
      'de':
          'Das Zögern bei der Einführung von KI kann dazu führen, dass Unternehmen ins Hintertreffen geraten, da ihnen die Effizienz und Innovationsgeschwindigkeit der KI-fähigen Wettbewerber fehlt, was sich auf die Marktposition auswirkt und eine Zurückhaltung gegenüber der Nutzung von Technologie zur Verbesserung signalisiert.',
      'es':
          'Dudar en adoptar la IA puede hacer que las empresas se queden atrás, ya que carecen de la eficiencia y la velocidad de innovación de los competidores habilitados por la IA, lo que afecta la posición en el mercado y señala una renuencia a adoptar la tecnología para mejorar.',
      'fr':
          'Hésiter à adopter l’IA peut amener les entreprises à prendre du retard, car elles n’ont pas l’efficacité et la rapidité d’innovation de leurs concurrents dotés de l’IA, ce qui affecte leur position sur le marché et signale une réticence à adopter la technologie pour l’amélioration.',
    },
    'kzdeeubh': {
      'en': 'Delayed Insights and Decision Making',
      'de': 'Verzögerte Erkenntnisse und Entscheidungsfindung',
      'es': 'Conocimientos y toma de decisiones retrasados',
      'fr': 'Informations et prise de décision retardées',
    },
    '0t5yf3yf': {
      'en':
          'Without AI for document analysis, businesses face delayed decision-making and reduced agility due to slower insight extraction, hindering the ability to respond to market changes and maintain competitiveness.',
      'de':
          'Ohne KI für die Dokumentenanalyse sind Unternehmen aufgrund der langsameren Gewinnung von Erkenntnissen mit einer verzögerten Entscheidungsfindung und einer geringeren Agilität konfrontiert, was die Fähigkeit beeinträchtigt, auf Marktveränderungen zu reagieren und die Wettbewerbsfähigkeit aufrechtzuerhalten.',
      'es':
          'Sin IA para el análisis de documentos, las empresas enfrentan retrasos en la toma de decisiones y una menor agilidad debido a una extracción de información más lenta, lo que dificulta la capacidad de responder a los cambios del mercado y mantener la competitividad.',
      'fr':
          'Sans l’IA pour l’analyse des documents, les entreprises sont confrontées à des prises de décision retardées et à une agilité réduite en raison d’une extraction plus lente des informations, ce qui entrave leur capacité à répondre aux changements du marché et à maintenir leur compétitivité.',
    },
    'jca9qq5k': {
      'en': 'Lost Chances for Better Customer Bonds and Personalization',
      'de': 'Verpasste Chancen für bessere Kundenbindung und Personalisierung',
      'es':
          'Oportunidades perdidas para mejorar los vínculos con los clientes y la personalización',
      'fr':
          'Chances perdues pour de meilleurs liens clients et une meilleure personnalisation',
    },
    '7ev0d22j': {
      'en':
          'Neglecting AI in personalization limits customer engagement and service effectiveness, missing chances to deepen relationships and deliver prompt, tailored services, a key competitive advantage.',
      'de':
          'Die Vernachlässigung von KI bei der Personalisierung schränkt die Kundenbindung und Serviceeffektivität ein und verpasst Chancen, Beziehungen zu vertiefen und zeitnahe, maßgeschneiderte Services bereitzustellen – ein entscheidender Wettbewerbsvorteil.',
      'es':
          'Descuidar la IA en la personalización limita la participación del cliente y la eficacia del servicio, perdiendo oportunidades de profundizar las relaciones y ofrecer servicios rápidos y personalizados, una ventaja competitiva clave.',
      'fr':
          'Négliger l’IA dans la personnalisation limite l’engagement client et l’efficacité des services, manquant ainsi des occasions d’approfondir les relations et de fournir des services rapides et personnalisés, un avantage concurrentiel clé.',
    },
    '80v7cyz2': {
      'en': 'Costs of Compliance and Risk Management',
      'de': 'Kosten für Compliance und Risikomanagement',
      'es': 'Costos de cumplimiento y gestión de riesgos',
      'fr': 'Coûts de conformité et de gestion des risques',
    },
    'u961schu': {
      'en':
          'Forgoing AI in compliance and risk management increases the risk of regulatory issues and reputational harm, as AI helps ensure documents meet legal standards, highlighting its importance for maintaining compliance and reputation.',
      'de':
          'Der Verzicht auf KI im Compliance- und Risikomanagement erhöht das Risiko regulatorischer Probleme und Reputationsschäden, da KI dazu beiträgt, dass Dokumente den gesetzlichen Standards entsprechen, was ihre Bedeutung für die Aufrechterhaltung von Compliance und Reputation unterstreicht.',
      'es':
          'Renunciar a la IA en el cumplimiento y la gestión de riesgos aumenta el riesgo de problemas regulatorios y daños a la reputación, ya que la IA ayuda a garantizar que los documentos cumplan con los estándares legales, destacando su importancia para mantener el cumplimiento y la reputación.',
      'fr':
          'Renoncer à l’IA en matière de conformité et de gestion des risques augmente le risque de problèmes réglementaires et d’atteinte à la réputation, car l’IA contribue à garantir que les documents respectent les normes juridiques, soulignant ainsi son importance pour le maintien de la conformité et de la réputation.',
    },
    '1ywg6vo4': {
      'en': 'Lost Innovation Opportunities Without AI Expertise',
      'de': 'Verlorene Innovationsmöglichkeiten ohne KI-Expertise',
      'es': 'Oportunidades de innovación perdidas sin experiencia en IA',
      'fr': 'Opportunités d’innovation perdues sans expertise en IA',
    },
    'zvc9x0nl': {
      'en':
          'Without Virtual AI Experts, companies miss out on accessing wide-ranging expertise for innovation, trend identification, and process improvement, stunting growth and innovation potential.',
      'de':
          'Ohne virtuelle KI-Experten verpassen Unternehmen den Zugriff auf umfassendes Fachwissen für Innovation, Trenderkennung und Prozessverbesserung, was Wachstum und Innovationspotenzial bremst.',
      'es':
          'Sin expertos virtuales en IA, las empresas pierden el acceso a una amplia experiencia para la innovación, la identificación de tendencias y la mejora de procesos, lo que frena el crecimiento y el potencial de innovación.',
      'fr':
          'Sans experts virtuels en IA, les entreprises n’ont pas accès à une vaste expertise en matière d’innovation, d’identification des tendances et d’amélioration des processus, ce qui freine la croissance et le potentiel d’innovation.',
    },
    'dld9ci4w': {
      'en': 'Harness the Potential of AI-Powered Domain Experts',
      'de': 'Nutzen Sie das Potenzial KI-gestützter Fachexperten',
      'es':
          'Aproveche el potencial de los expertos en dominios impulsados ​​por IA',
      'fr': 'Exploitez le potentiel des experts de domaine basés sur l\'IA',
    },
    'mjmxr9iq': {
      'en':
          'Say hello to a team of personalized AI Assistants that aid in the creation, enhancement and\ndelivery of critical industry specific regulated documents.',
      'de':
          'Begrüßen Sie ein Team personalisierter KI-Assistenten, die bei der Erstellung, Verbesserung und Bereitstellung kritischer branchenspezifischer regulierter Dokumente helfen.',
      'es':
          'Saluda a un equipo de asistentes de IA personalizados que ayudan en la creación, mejora y\nentrega de documentos regulados críticos específicos de la industria.',
      'fr':
          'Dites bonjour à une équipe d\'assistants IA personnalisés qui aident à la création, à l\'amélioration et à la\nlivraison de documents réglementés critiques spécifiques à l\'industrie.',
    },
    'bm17huuy': {
      'en': 'What can Ainzel do for you?',
      'de': 'Was kann Ainzel für Sie tun?',
      'es': '¿Qué puede hacer Ainzel por ti?',
      'fr': 'Que peut faire Ainzel pour vous ?',
    },
    'xcpb6y3m': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'vu7zg07i': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '4igunfor': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'asq5mj4m': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'wrd2iy67': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'y45fbjlk': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'sdjodfei': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'd3grhne2': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'vtnnjynh': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    '1m4u4bau': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'a4miucxy': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'u0vih3dl': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    '462p5bjv': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'xfwvi8ws': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'i73vnl1f': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'g4kc6w74': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'yt001h88': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'he1wu8l5': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
    'llrbq5ec': {
      'en': 'Virtual AI Experts At Your FingerTips',
      'de': 'Virtuelle KI-Experten immer zur Hand',
      'es': 'Expertos virtuales en IA a su alcance',
      'fr': 'Des experts en IA virtuelle à votre portée',
    },
    'wh36vg47': {
      'en': 'Kate',
      'de': 'Kate',
      'es': 'kate',
      'fr': 'Kate',
    },
    'td0y4dnq': {
      'en': 'Finance',
      'de': 'Finanzen',
      'es': 'Finanzas',
      'fr': 'Finance',
    },
    'xkrub093': {
      'en': 'Mike',
      'de': 'Mike',
      'es': 'Miguel',
      'fr': 'Mike',
    },
    'jjx1edzk': {
      'en': 'Operations',
      'de': 'Operationen',
      'es': 'Operaciones',
      'fr': 'Opérations',
    },
    'am3kndkm': {
      'en': 'Jonathan',
      'de': 'Jonathan',
      'es': 'jonathan',
      'fr': 'Jonathan',
    },
    'a301y4iv': {
      'en': 'Services',
      'de': 'Dienstleistungen',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'z348wjjx': {
      'en': 'Alice',
      'de': 'Alice',
      'es': 'Alicia',
      'fr': 'Alice',
    },
    'p3bnx1qa': {
      'en': 'Sales',
      'de': 'Verkäufe',
      'es': 'Ventas',
      'fr': 'Ventes',
    },
    'rs346ca1': {
      'en': 'John',
      'de': 'John',
      'es': 'John',
      'fr': 'John',
    },
    'ivql87qh': {
      'en': 'Marketing',
      'de': 'Marketing',
      'es': 'Marketing',
      'fr': 'Commercialisation',
    },
    'nnsn9hi4': {
      'en': 'Fred',
      'de': 'Fred',
      'es': 'fred',
      'fr': 'Fred',
    },
    'w8qvd7zw': {
      'en': 'Legal',
      'de': 'Legal',
      'es': 'Legal',
      'fr': 'Légal',
    },
    'z2y6pxyg': {
      'en': 'Mark',
      'de': 'Markieren',
      'es': 'Marca',
      'fr': 'Marque',
    },
    'h5vltwr6': {
      'en': 'Strategy',
      'de': 'Strategie',
      'es': 'Estrategia',
      'fr': 'Stratégie',
    },
    'f9vfpyia': {
      'en': 'Christine',
      'de': 'Christine',
      'es': 'cristina',
      'fr': 'Christine',
    },
    '59mrqm1n': {
      'en': 'HR',
      'de': 'Personalwesen',
      'es': 'HORA',
      'fr': 'HEURE',
    },
    'rli6yjvn': {
      'en': 'AI-Powered Solutions for Industry-Specific Challenges',
      'de': 'KI-gestützte Lösungen für branchenspezifische Herausforderungen',
      'es':
          'Soluciones impulsadas por IA para desafíos específicos de la industria',
      'fr':
          'Solutions basées sur l\'IA pour les défis spécifiques à l\'industrie',
    },
    '3swvg9jj': {
      'en':
          'Procedure heavy industries are riddled with documents that need to be completed & submitted. \nAI offers an opportunity for automation, enhancement & process improvement. ',
      'de':
          'Die verfahrenstechnische Schwerindustrie ist mit Dokumenten übersät, die ausgefüllt und eingereicht werden müssen. \nKI bietet Möglichkeiten zur Automatisierung, Erweiterung und Prozessverbesserung.',
      'es':
          'Las industrias pesadas de procedimientos están plagadas de documentos que deben completarse y enviarse. \nLa IA ofrece una oportunidad para la automatización, mejora y mejora de procesos.',
      'fr':
          'Les industries lourdes de procédures sont criblées de documents qui doivent être complétés et soumis. \nL\'IA offre une opportunité d\'automatisation, d\'amélioration et d\'amélioration des processus.',
    },
    'mim5898j': {
      'en': 'Banking',
      'de': 'Bankwesen',
      'es': 'Bancario',
      'fr': 'Bancaire',
    },
    'y2aeabb7': {
      'en': 'Credit WriteUps',
      'de': 'Kreditauskünfte',
      'es': 'Evaluaciones de crédito',
      'fr': 'Rédactions de crédit',
    },
    '6mxnehbj': {
      'en': 'Loan Application  Forms',
      'de': 'Kreditantragsformulare',
      'es': 'Formularios de solicitud de préstamo',
      'fr': 'Formulaires de demande de prêt',
    },
    'rdulbuqv': {
      'en': 'Mortgage Agreement',
      'de': 'Hypothekenvertrag',
      'es': 'Acuerdo Hipotecario',
      'fr': 'Contrat hypothécaire',
    },
    'z0yhydvr': {
      'en': 'Business Plans for Loan Application',
      'de': 'Geschäftspläne für die Kreditbeantragung',
      'es': 'Planes de negocios para la solicitud de préstamo',
      'fr': 'Plans d\'affaires pour la demande de prêt',
    },
    'khjl6w3i': {
      'en': 'Audit Reports',
      'de': 'Auditberichte',
      'es': 'Informes de auditoría',
      'fr': 'Rapports d\'audit',
    },
    'md85p2vd': {
      'en': 'Pharma',
      'de': 'Pharma',
      'es': 'Farmacéutica',
      'fr': 'Pharmaceutique',
    },
    'lamumhwt': {
      'en': 'Clinical Trial Protocols',
      'de': 'Protokolle für klinische Studien',
      'es': 'Protocolos de ensayos clínicos',
      'fr': 'Protocoles d\'essais cliniques',
    },
    'u1vm0vrz': {
      'en': 'Manufacturing Procedures',
      'de': 'Herstellungsverfahren',
      'es': 'Procedimientos de fabricación',
      'fr': 'Procédures de fabrication',
    },
    '2eqtnjx7': {
      'en': 'Quality Assurance Documents',
      'de': 'Qualitätssicherungsdokumente',
      'es': 'Documentos de garantía de calidad',
      'fr': 'Documents d\'assurance qualité',
    },
    '62awze6v': {
      'en': 'Product Specifications',
      'de': 'Produktspezifikationen',
      'es': 'Especificaciones del producto',
      'fr': 'Spécifications du produit',
    },
    'rckoqm31': {
      'en': 'Environmental Impact Assessments',
      'de': 'Umweltverträglichkeitsprüfungen',
      'es': 'Evaluaciones de Impacto Ambiental',
      'fr': 'Évaluations d\'impact environnemental',
    },
    'y5rtvey6': {
      'en': 'Public Sector',
      'de': 'Öffentlicher Sektor',
      'es': 'Sector público',
      'fr': 'Secteur public',
    },
    'hiyuob63': {
      'en': 'Public Project Tender Documents',
      'de': 'Ausschreibungsunterlagen für öffentliche Projekte',
      'es': 'Pliegos de Licitación de Proyectos Públicos',
      'fr': 'Documents d\'appel d\'offres publics pour les projets',
    },
    'dncs8xge': {
      'en': 'Regulatory Compliance Reports',
      'de': 'Berichte zur Einhaltung gesetzlicher Vorschriften',
      'es': 'Informes de Cumplimiento Normativo',
      'fr': 'Rapports de conformité réglementaire',
    },
    '69nra9yo': {
      'en': 'Contracts and Agreements',
      'de': 'Verträge und Vereinbarungen',
      'es': 'Contratos y Acuerdos',
      'fr': 'Contrats et accords',
    },
    'd4v31fl9': {
      'en': 'Permits',
      'de': 'Genehmigungen',
      'es': 'Permisos',
      'fr': 'Permis',
    },
    'ualdd3qv': {
      'en': 'Public Safety and Security Protocols',
      'de': 'Protokolle zur öffentlichen Sicherheit und Gefahrenabwehr',
      'es': 'Protocolos de seguridad pública y protección',
      'fr': 'Protocoles de sûreté et de sécurité publiques',
    },
    'k280vy17': {
      'en': 'Professional Services',
      'de': 'Professionelle Dienste',
      'es': 'Servicios profesionales',
      'fr': 'Services professionnels',
    },
    'pzu8yhx1': {
      'en': 'Service Agreements & Contract',
      'de': 'Servicevereinbarungen und Verträge',
      'es': 'Acuerdos y contratos de servicio',
      'fr': 'Accords et contrats de service',
    },
    'pxulznfp': {
      'en': 'Proposals & Bids',
      'de': 'Vorschläge und Angebote',
      'es': 'Propuestas y ofertas',
      'fr': 'Propositions et offres',
    },
    'kguxvzay': {
      'en': 'Project Plans & Schedules',
      'de': 'Projektpläne und Zeitpläne',
      'es': 'Planes y cronogramas del proyecto',
      'fr': 'Plans et calendriers du projet',
    },
    '2rzala20': {
      'en': 'Marketing Material',
      'de': 'Werbematerial',
      'es': 'Material de marketing',
      'fr': 'Matériel de marketing',
    },
    'n88scrxn': {
      'en': 'Training Material',
      'de': 'Schulungsunterlagen',
      'es': 'Material de entrenamiento',
      'fr': 'Matériel de formation',
    },
    'iutpakh5': {
      'en': 'On a mission to deliver ',
      'de': 'Auf der Mission zu liefern',
      'es': 'En una misión para entregar',
      'fr': 'En mission pour livrer',
    },
    'rc6yz70u': {
      'en': '100 million hours of AI-Powered Assistance ',
      'de': '100 Millionen Stunden KI-gestützte Unterstützung',
      'es': '100 millones de horas de asistencia impulsada por IA',
      'fr': '100 millions d\'heures d\'assistance basée sur l\'IA',
    },
    'fkxaf6nh': {
      'en': 'by 2025.',
      'de': 'bis 2025.',
      'es': 'para 2025.',
      'fr': 'd\'ici 2025.',
    },
    'g0m5px31': {
      'en': 'GET STARTED...TODAY!',
      'de': 'Fangen Sie an... HEUTE!',
      'es': '¡EMPIECE HOY!',
      'fr': 'COMMENCER AUJOURD\'HUI!',
    },
    'bs4pz827': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
  },
  // HomeMain3
  {
    '5es8z7h8': {
      'en':
          'Be AI-Ready: Future-proof your business with unlimited expertise through AI.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher mit unbegrenztem Fachwissen durch KI.',
      'es':
          'Esté preparado para la IA: prepare su negocio para el futuro con experiencia ilimitada a través de la IA.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir grâce à une expertise illimitée grâce à l\'IA.',
    },
    '4pkf7njb': {
      'en':
          'Deliver high-quality and budget-friendly business content faster than ever.',
      'de':
          'Liefern Sie hochwertige und kostengünstige Geschäftsinhalte schneller als je zuvor.',
      'es':
          'Ofrezca contenido empresarial de alta calidad y económico más rápido que nunca.',
      'fr':
          'Produisez du contenu professionnel de haute qualité et économique plus rapidement que jamais.',
    },
    'sn74x5it': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'xg775fwi': {
      'en': 'Banking',
      'de': 'Bankwesen',
      'es': 'Bancario',
      'fr': 'Bancaire',
    },
    '8p5n1w2j': {
      'en': 'Credit WriteUps',
      'de': 'Kreditauskünfte',
      'es': 'Evaluaciones de crédito',
      'fr': 'Rédactions de crédit',
    },
    '3j1urknn': {
      'en': 'Loan Application  Forms',
      'de': 'Kreditantragsformulare',
      'es': 'Formularios de solicitud de préstamo',
      'fr': 'Formulaires de demande de prêt',
    },
    'y7lzv0ka': {
      'en': 'Mortgage Agreement',
      'de': 'Hypothekenvertrag',
      'es': 'Acuerdo Hipotecario',
      'fr': 'Contrat hypothécaire',
    },
    '12drl42v': {
      'en': 'Business Plans for Loan Application',
      'de': 'Geschäftspläne für die Kreditbeantragung',
      'es': 'Planes de negocios para la solicitud de préstamo',
      'fr': 'Plans d\'affaires pour la demande de prêt',
    },
    'qgbxue3d': {
      'en': 'Audit Reports',
      'de': 'Auditberichte',
      'es': 'Informes de auditoría',
      'fr': 'Rapports d\'audit',
    },
    'l9869xsh': {
      'en': 'Professional Services',
      'de': 'Professionelle Dienste',
      'es': 'Servicios profesionales',
      'fr': 'Services professionnels',
    },
    'we07ty9g': {
      'en': 'Service Agreements & Contracts',
      'de': 'Servicevereinbarungen und Verträge',
      'es': 'Acuerdos y contratos de servicio',
      'fr': 'Accords et contrats de service',
    },
    'jyifpz6x': {
      'en': 'Proposals & Bids',
      'de': 'Vorschläge und Angebote',
      'es': 'Propuestas y ofertas',
      'fr': 'Propositions et offres',
    },
    'uxdqsuyk': {
      'en': 'Project Plans & Schedules',
      'de': 'Projektpläne und Zeitpläne',
      'es': 'Planes y cronogramas del proyecto',
      'fr': 'Plans et calendriers du projet',
    },
    'm2qr2s6j': {
      'en': 'Marketing Material',
      'de': 'Werbematerial',
      'es': 'Material de marketing',
      'fr': 'Matériel de marketing',
    },
    'ipg24f4q': {
      'en': 'Training Material',
      'de': 'Schulungsunterlagen',
      'es': 'Material de entrenamiento',
      'fr': 'Matériel de formation',
    },
    'vrg7pepd': {
      'en': 'Public Sector',
      'de': 'Öffentlicher Sektor',
      'es': 'Sector público',
      'fr': 'Secteur public',
    },
    'shihzfge': {
      'en': 'Public Project Tender Documents',
      'de': 'Ausschreibungsunterlagen für öffentliche Projekte',
      'es': 'Pliegos de Licitación de Proyectos Públicos',
      'fr': 'Documents d\'appel d\'offres publics pour les projets',
    },
    'dp6328h1': {
      'en': 'Regulatory Compliance Reports',
      'de': 'Berichte zur Einhaltung gesetzlicher Vorschriften',
      'es': 'Informes de Cumplimiento Normativo',
      'fr': 'Rapports de conformité réglementaire',
    },
    'bsasb19a': {
      'en': 'Contracts and Agreements',
      'de': 'Verträge und Vereinbarungen',
      'es': 'Contratos y Acuerdos',
      'fr': 'Contrats et accords',
    },
    '3vce6byl': {
      'en': 'Permits',
      'de': 'Genehmigungen',
      'es': 'Permisos',
      'fr': 'Permis',
    },
    'e5h0iaac': {
      'en': 'Public Safety and Security Protocols',
      'de': 'Protokolle zur öffentlichen Sicherheit und Gefahrenabwehr',
      'es': 'Protocolos de seguridad pública y protección',
      'fr': 'Protocoles de sûreté et de sécurité publiques',
    },
    '1dh6h98j': {
      'en': 'Pharma',
      'de': 'Pharma',
      'es': 'Farmacéutica',
      'fr': 'Pharmaceutique',
    },
    '8rndqsox': {
      'en': 'Clinical Trial Protocols',
      'de': 'Protokolle für klinische Studien',
      'es': 'Protocolos de ensayos clínicos',
      'fr': 'Protocoles d\'essais cliniques',
    },
    'l8nnly6i': {
      'en': 'Manufacturing Procedures',
      'de': 'Herstellungsverfahren',
      'es': 'Procedimientos de fabricación',
      'fr': 'Procédures de fabrication',
    },
    'k1bu38t2': {
      'en': 'Quality Assurance Documents',
      'de': 'Qualitätssicherungsdokumente',
      'es': 'Documentos de garantía de calidad',
      'fr': 'Documents d\'assurance qualité',
    },
    'jiw2zpo7': {
      'en': 'Product Specifications',
      'de': 'Produktspezifikationen',
      'es': 'Especificaciones del producto',
      'fr': 'Spécifications du produit',
    },
    'i6llkpjn': {
      'en': 'Environmental Impact Assessments',
      'de': 'Umweltverträglichkeitsprüfungen',
      'es': 'Evaluaciones de Impacto Ambiental',
      'fr': 'Évaluations d\'impact environnemental',
    },
    'slydui4s': {
      'en':
          'Skipping Virtual AI Expertise in content creation risks financial setbacks and lost opportunities',
      'de':
          'Der Verzicht auf virtuelle KI-Expertise bei der Inhaltserstellung birgt das Risiko finanzieller Rückschläge und verpasster Chancen',
      'es':
          'Saltarse la experiencia en IA virtual en la creación de contenido corre el riesgo de sufrir reveses financieros y perder oportunidades',
      'fr':
          'Ignorer l\'expertise en IA virtuelle dans la création de contenu risque de subir des revers financiers et des opportunités perdues.',
    },
    '92p2lvgk': {
      'en': 'Increased Time Consumption \nand Reduced Efficiency',
      'de': 'Erhöhter Zeitverbrauch \nund verringerte Effizienz',
      'es': 'Mayor consumo de tiempo \ny reducción de la eficiencia',
      'fr':
          'Augmentation de la consommation de temps \n et réduction de l\'efficacité',
    },
    'yey1pxbm': {
      'en': 'Lack of \nCompetitive Edge',
      'de': 'Fehlender \nWettbewerbsvorteil',
      'es': 'Falta de \nventaja competitiva',
      'fr': 'Manque d\'\navantage concurrentiel',
    },
    'fmlx2y6a': {
      'en': 'Delayed Insights and Decision Making',
      'de': 'Verzögerte Erkenntnisse und Entscheidungsfindung',
      'es': 'Conocimientos y toma de decisiones retrasados',
      'fr': 'Informations et prise de décision retardées',
    },
    '3z96qeel': {
      'en': 'Lost Chances for Better Customer Bonds',
      'de': 'Verpasste Chancen auf bessere Kundenbindungen',
      'es': 'Oportunidades perdidas de mejores vínculos con los clientes',
      'fr': 'Chances perdues pour de meilleures obligations clients',
    },
    'tqqlvmq5': {
      'en': 'Costs of Compliance and Risk Management',
      'de': 'Kosten für Compliance und Risikomanagement',
      'es': 'Costos de cumplimiento y gestión de riesgos',
      'fr': 'Coûts de conformité et de gestion des risques',
    },
    'ji5uk82f': {
      'en': 'Lost Innovation Opportunities',
      'de': 'Verlorene Innovationsmöglichkeiten',
      'es': 'Oportunidades de innovación perdidas',
      'fr': 'Opportunités d’innovation perdues',
    },
    'ssrxc2b4': {
      'en': 'Harness the Potential of AI-Powered Domain Experts',
      'de': 'Nutzen Sie das Potenzial KI-gestützter Fachexperten',
      'es':
          'Aproveche el potencial de los expertos en dominios impulsados ​​por IA',
      'fr': 'Exploitez le potentiel des experts de domaine basés sur l\'IA',
    },
    '8xpkgnll': {
      'en':
          'Say hello to a team of personalized AI Assistants that aid in the creation, enhancement and delivery of critical industry specific content.',
      'de':
          'Begrüßen Sie ein Team personalisierter KI-Assistenten, die Sie bei der Erstellung, Verbesserung und Bereitstellung wichtiger branchenspezifischer Inhalte unterstützen.',
      'es':
          'Saluda a un equipo de asistentes de IA personalizados que ayudan en la creación, mejora y entrega de contenido crítico específico de la industria.',
      'fr':
          'Dites bonjour à une équipe d’assistants IA personnalisés qui aident à la création, à l’amélioration et à la diffusion de contenu critique spécifique à l’industrie.',
    },
    'jaa5fdqr': {
      'en': 'What can Ainzel do for you?',
      'de': 'Was kann Ainzel für Sie tun?',
      'es': '¿Qué puede hacer Ainzel por ti?',
      'fr': 'Que peut faire Ainzel pour vous ?',
    },
    'a8r2md9u': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'xendwu9v': {
      'en':
          'Our Virtual AI Experts cut through the complexity of content management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere Experten für virtuelle KI durchbrechen die Komplexität des Content-Managements, sparen Ihnen Zeit und ermöglichen es Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de contenidos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion de contenu, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'qdybui4j': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    '8jp0s7ah': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    'tc9dwxwl': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'lclca7d7': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '9uk1gfi2': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'r65axw8n': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '5kj2gkx1': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'jr2krkyg': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    '4kvrdi08': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    '0nu3if7m': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'k3ahis6p': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    'xbgeh141': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'p0w2bbbl': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    'zmt8vley': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'tr92gxqx': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    'p10t4p0b': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
    '5c1whww6': {
      'en': 'Virtual AI Experts \nAt Your FingerTips',
      'de': 'Virtuelle KI-Experten \n immer zur Hand',
      'es': 'Expertos virtuales en IA \nA su alcance',
      'fr': 'Des experts en IA virtuelle \nà portée de main',
    },
    'ch3v9l3l': {
      'en': 'Kate',
      'de': 'Kate',
      'es': 'kate',
      'fr': 'Kate',
    },
    'jsgk6243': {
      'en': 'Finance',
      'de': 'Finanzen',
      'es': 'Finanzas',
      'fr': 'Finance',
    },
    'omq4zfom': {
      'en': 'Mike',
      'de': 'Mike',
      'es': 'Miguel',
      'fr': 'Mike',
    },
    '1lf13muv': {
      'en': 'Operations',
      'de': 'Operationen',
      'es': 'Operaciones',
      'fr': 'Opérations',
    },
    'u2m3xf9o': {
      'en': 'Jonathan',
      'de': 'Jonathan',
      'es': 'jonathan',
      'fr': 'Jonathan',
    },
    'ktxeu5kx': {
      'en': 'Services',
      'de': 'Dienstleistungen',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'jmoyt45d': {
      'en': 'Alice',
      'de': 'Alice',
      'es': 'Alicia',
      'fr': 'Alice',
    },
    '8exmcn5b': {
      'en': 'Sales',
      'de': 'Verkäufe',
      'es': 'Ventas',
      'fr': 'Ventes',
    },
    'oyj38e93': {
      'en': 'John',
      'de': 'John',
      'es': 'John',
      'fr': 'John',
    },
    'jjlj0k2u': {
      'en': 'Marketing',
      'de': 'Marketing',
      'es': 'Marketing',
      'fr': 'Commercialisation',
    },
    'n2d1iudq': {
      'en': 'Mark',
      'de': 'Markieren',
      'es': 'Marca',
      'fr': 'Marque',
    },
    'rb1cpzfz': {
      'en': 'Strategy',
      'de': 'Strategie',
      'es': 'Estrategia',
      'fr': 'Stratégie',
    },
    'pfjw60ma': {
      'en': 'Christine',
      'de': 'Christine',
      'es': 'cristina',
      'fr': 'Christine',
    },
    'vxxgcyr4': {
      'en': 'HR',
      'de': 'Personalwesen',
      'es': 'HORA',
      'fr': 'HEURE',
    },
    '7zlyw8d4': {
      'en': 'Tom',
      'de': 'Tom',
      'es': 'Tomás',
      'fr': 'À M',
    },
    'r2md3zdm': {
      'en': 'Compliance',
      'de': 'Einhaltung',
      'es': 'Cumplimiento',
      'fr': 'Conformité',
    },
    '3folxwvp': {
      'en': 'On a mission to deliver ',
      'de': 'On a mission to deliver ',
      'es': 'On a mission to deliver ',
      'fr': 'On a mission to deliver ',
    },
    'a0su4phl': {
      'en': '100 million hours of AI-Powered Assistance  ',
      'de': '100 million hours of AI-Powered Assistance  ',
      'es': '100 million hours of AI-Powered Assistance  ',
      'fr': '100 million hours of AI-Powered Assistance  ',
    },
    'zz76xz9p': {
      'en': 'by 2025.',
      'de': 'by 2025.',
      'es': 'by 2025.',
      'fr': 'by 2025.',
    },
    '25vnzh35': {
      'en': 'GET STARTED...TODAY!',
      'de': 'Fangen Sie an... HEUTE!',
      'es': '¡EMPIECE HOY!',
      'fr': 'COMMENCER AUJOURD\'HUI!',
    },
    'g2j363d7': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
  },
  // HomeHighTechCopy
  {
    '2uvq01wd': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '86rudd3s': {
      'en': 'Create Superior ESG Reports\nWith Virtual AI Experts.',
      'de':
          'Erstellen Sie hochwertige Geschäftsdokumente\nmit virtuellen KI-Experten.',
      'es':
          'Cree documentos comerciales superiores\nCon expertos virtuales en IA.',
      'fr':
          'Créez des documents commerciaux de qualité supérieure\nAvec des experts en IA virtuelle.',
    },
    '36j3591x': {
      'en': 'Be AI-Ready: Future-proof Your HighTech Company',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'mti58xpn': {
      'en': ' and Unlock Emerging Opportunities.',
      'de':
          'Seien Sie bereit für KI: Machen Sie Ihr Unternehmen zukunftssicher und nutzen Sie neue Chancen.',
      'es':
          'Esté preparado para la IA: prepare su empresa para el futuro y desbloquee oportunidades emergentes.',
      'fr':
          'Soyez prêt pour l\'IA : préparez votre entreprise pour l\'avenir et débloquez des opportunités émergentes.',
    },
    'aclbp2bh': {
      'en': 'Read the Whitepaper',
      'de': 'Whitepaper lesen',
      'es': 'Lea el documento técnico',
      'fr': 'Lire le livre blanc',
    },
    'lvuglqrg': {
      'en': 'Request a Demo',
      'de': 'Demo anfordern',
      'es': 'Solicitar una demostración',
      'fr': 'Demander une démo',
    },
    '2scy7q0t': {
      'en':
          'Crafting Environmental, Social, and Governance (ESG) reports without the assistance of Virtual AI Experts places your high-tech company at a considerable disadvantage, leading to costs and missed opportunities that can negatively impact performance and growth:',
      'de':
          'Die Erstellung von Umwelt-, Sozial- und Governance-Berichten (ESG) ohne die Unterstützung von Experten für virtuelle KI bringt Ihr High-Tech-Unternehmen in einen erheblichen Nachteil, was zu Kosten und verpassten Chancen führt, die sich negativ auf Leistung und Wachstum auswirken können:',
      'es':
          'La elaboración de informes ambientales, sociales y de gobernanza (ESG) sin la ayuda de expertos virtuales en IA coloca a su empresa de alta tecnología en una desventaja considerable, lo que genera costos y oportunidades perdidas que pueden afectar negativamente el rendimiento y el crecimiento:',
      'fr':
          'L\'élaboration de rapports environnementaux, sociaux et de gouvernance (ESG) sans l\'aide d\'experts en IA virtuelle place votre entreprise de haute technologie dans une position considérablement désavantageuse, entraînant des coûts et des opportunités manquées qui peuvent avoir un impact négatif sur les performances et la croissance :',
    },
    'ik5zzm5t': {
      'en': 'Increased Time Consumption and Reduced Efficiency',
      'de': 'Erhöhter Zeitverbrauch und verringerte Effizienz',
      'es': 'Mayor consumo de tiempo y menor eficiencia',
      'fr': 'Consommation de temps accrue et efficacité réduite',
    },
    'v04flo5f': {
      'en':
          'The lack of AI in document-related tasks significantly heightens time consumption for creation, editing, and formatting, while also hindering the processing, analysis, and organization of large datasets. This dual impact not only diverts valuable resources from innovative and strategic tasks but also introduces delays and inefficiencies across operations. Consequently, businesses miss out on maximizing their human capital and face potential missed opportunities due to slower operational processes.',
      'de':
          'Der Mangel an KI bei dokumentenbezogenen Aufgaben erhöht den Zeitaufwand für die Erstellung, Bearbeitung und Formatierung erheblich und behindert gleichzeitig die Verarbeitung, Analyse und Organisation großer Datensätze. Diese doppelte Auswirkung zieht nicht nur wertvolle Ressourcen von innovativen und strategischen Aufgaben ab, sondern führt auch zu Verzögerungen und Ineffizienzen im gesamten Betrieb. Folglich verpassen Unternehmen die Maximierung ihres Humankapitals und sehen sich potenziell verpassten Chancen aufgrund langsamerer Betriebsabläufe gegenüber.',
      'es':
          'La falta de IA en las tareas relacionadas con documentos aumenta significativamente el consumo de tiempo para la creación, edición y formato, al tiempo que dificulta el procesamiento, análisis y organización de grandes conjuntos de datos. Este doble impacto no sólo desvía recursos valiosos de tareas innovadoras y estratégicas, sino que también introduce retrasos e ineficiencias en todas las operaciones. En consecuencia, las empresas no logran maximizar su capital humano y enfrentan posibles oportunidades perdidas debido a procesos operativos más lentos.',
      'fr':
          'Le manque d’IA dans les tâches liées aux documents augmente considérablement le temps consacré à la création, à l’édition et au formatage, tout en entravant le traitement, l’analyse et l’organisation de grands ensembles de données. Ce double impact détourne non seulement des ressources précieuses des tâches innovantes et stratégiques, mais introduit également des retards et des inefficacités dans les opérations. Par conséquent, les entreprises ne parviennent pas à maximiser leur capital humain et sont confrontées à des opportunités potentielles manquées en raison du ralentissement des processus opérationnels.',
    },
    'o7wmjdkd': {
      'en': 'Lack of Competitive Edge',
      'de': 'Mangel an Wettbewerbsvorteilen',
      'es': 'Falta de ventaja competitiva',
      'fr': 'Manque d’avantage concurrentiel',
    },
    '5ymxk9pp': {
      'en':
          'Businesses that hesitate to adopt AI technology stand at a risk of lagging in the competitive landscape. Without AI, they struggle to achieve the operational efficiency and innovation speed that their AI-empowered counterparts excel at. This technological gap can lead to diminished market positioning, as companies using AI can optimize processes, enhance customer experiences, and introduce innovative products and services more swiftly. Moreover, AI adoption signals to customers, investors, and partners a commitment to leveraging cutting-edge technology for continuous improvement and sustainability. ',
      'de':
          'Unternehmen, die zögern, KI-Technologie einzuführen, laufen Gefahr, im Wettbewerb zurückzubleiben. Ohne KI haben sie Schwierigkeiten, die betriebliche Effizienz und Innovationsgeschwindigkeit zu erreichen, die ihre KI-gestützten Kollegen auszeichnen. Diese technologische Lücke kann zu einer verminderten Marktpositionierung führen, da Unternehmen, die KI nutzen, Prozesse optimieren, das Kundenerlebnis verbessern und innovative Produkte und Dienstleistungen schneller einführen können. Darüber hinaus signalisiert die Einführung von KI Kunden, Investoren und Partnern die Verpflichtung, Spitzentechnologie für kontinuierliche Verbesserung und Nachhaltigkeit zu nutzen.',
      'es':
          'Las empresas que dudan en adoptar la tecnología de IA corren el riesgo de quedarse rezagadas en el panorama competitivo. Sin IA, luchan por lograr la eficiencia operativa y la velocidad de innovación en las que sobresalen sus contrapartes potenciadas por IA. Esta brecha tecnológica puede conducir a un menor posicionamiento en el mercado, ya que las empresas que utilizan IA pueden optimizar procesos, mejorar las experiencias de los clientes e introducir productos y servicios innovadores más rápidamente. Además, la adopción de la IA indica a los clientes, inversores y socios un compromiso de aprovechar la tecnología de vanguardia para la mejora continua y la sostenibilidad.',
      'fr':
          'Les entreprises qui hésitent à adopter la technologie de l’IA risquent d’être à la traîne dans le paysage concurrentiel. Sans l’IA, elles ont du mal à atteindre l’efficacité opérationnelle et la vitesse d’innovation dans lesquelles excellent leurs homologues dotés de l’IA. Ce fossé technologique peut entraîner une diminution de leur positionnement sur le marché, dans la mesure où les entreprises utilisant l’IA peuvent optimiser leurs processus, améliorer l’expérience client et introduire plus rapidement des produits et services innovants. De plus, l’adoption de l’IA signale aux clients, aux investisseurs et aux partenaires leur engagement à tirer parti des technologies de pointe pour une amélioration continue et une durabilité accrue.',
    },
    'bk5voy40': {
      'en': 'Delayed Insights and Decision Making',
      'de': 'Verzögerte Erkenntnisse und Entscheidungsfindung',
      'es': 'Conocimientos y toma de decisiones retrasados',
      'fr': 'Informations et prise de décision retardées',
    },
    'mc03esxz': {
      'en':
          'The absence of AI in the analysis of business documents considerably hampers the extraction of actionable insights, leading to delays in decision-making and a reduction in strategic agility. AI\'s unparalleled ability to process vast volumes of data and perform complex analyses swiftly is fundamental for obtaining timely, informed insights essential for making strategic choices. This rapid access to insights is crucial for businesses aiming to quickly adapt to market changes, seize opportunities, and maintain a competitive edge in the fast-paced business environment.',
      'de':
          'Das Fehlen von KI bei der Analyse von Geschäftsdokumenten erschwert die Gewinnung umsetzbarer Erkenntnisse erheblich, was zu Verzögerungen bei der Entscheidungsfindung und einer Verringerung der strategischen Agilität führt. Die beispiellose Fähigkeit der KI, riesige Datenmengen zu verarbeiten und komplexe Analysen schnell durchzuführen, ist von grundlegender Bedeutung für die Gewinnung zeitnaher, fundierter Erkenntnisse, die für strategische Entscheidungen unerlässlich sind. Dieser schnelle Zugriff auf Erkenntnisse ist für Unternehmen von entscheidender Bedeutung, die sich schnell an Marktveränderungen anpassen, Chancen nutzen und im schnelllebigen Geschäftsumfeld einen Wettbewerbsvorteil wahren wollen.',
      'es':
          'La ausencia de IA en el análisis de documentos comerciales dificulta considerablemente la extracción de conocimientos procesables, lo que provoca retrasos en la toma de decisiones y una reducción de la agilidad estratégica. La capacidad incomparable de la IA para procesar grandes volúmenes de datos y realizar análisis complejos rápidamente es fundamental para obtener información oportuna e informada, esencial para tomar decisiones estratégicas. Este rápido acceso a conocimientos es crucial para las empresas que buscan adaptarse rápidamente a los cambios del mercado, aprovechar oportunidades y mantener una ventaja competitiva en el entorno empresarial acelerado.',
      'fr':
          'L’absence d’IA dans l’analyse des documents commerciaux entrave considérablement l’extraction d’informations exploitables, entraînant des retards dans la prise de décision et une réduction de l’agilité stratégique. La capacité inégalée de l\'IA à traiter de vastes volumes de données et à effectuer rapidement des analyses complexes est fondamentale pour obtenir des informations opportunes et éclairées, essentielles à la prise de décisions stratégiques. Cet accès rapide aux informations est crucial pour les entreprises qui souhaitent s\'adapter rapidement aux changements du marché, saisir les opportunités et conserver un avantage concurrentiel dans un environnement commercial en évolution rapide.',
    },
    '2h2mk4g7': {
      'en': 'Lost Chances for Better Customer Bonds and Personalization',
      'de': 'Verpasste Chancen für bessere Kundenbindung und Personalisierung',
      'es':
          'Oportunidades perdidas para mejorar los vínculos con los clientes y la personalización',
      'fr':
          'Chances perdues pour de meilleurs liens clients et une meilleure personnalisation',
    },
    'meseqj6v': {
      'en':
          'Failing to utilize AI for personalization means missing out on key opportunities to tailor documents and interactions to individual customer preferences, a vital strategy for enhancing engagement and service. This oversight limits the ability to strengthen customer relationships and deliver faster, more effective service. AI-driven personalization provides a competitive edge by enabling businesses to anticipate and meet customer needs with unparalleled precision and speed.',
      'de':
          'Wenn KI nicht für die Personalisierung genutzt wird, werden wichtige Möglichkeiten zur Anpassung von Dokumenten und Interaktionen an individuelle Kundenpräferenzen verpasst – eine wichtige Strategie zur Verbesserung von Engagement und Service. Dieses Versehen schränkt die Fähigkeit ein, Kundenbeziehungen zu stärken und einen schnelleren und effektiveren Service zu bieten. KI-gesteuerte Personalisierung verschafft Unternehmen einen Wettbewerbsvorteil, indem sie es ihnen ermöglicht, Kundenbedürfnisse mit beispielloser Präzision und Geschwindigkeit zu antizipieren und zu erfüllen.',
      'es':
          'No utilizar la IA para la personalización significa perder oportunidades clave para adaptar documentos e interacciones a las preferencias individuales de los clientes, una estrategia vital para mejorar el compromiso y el servicio. Esta supervisión limita la capacidad de fortalecer las relaciones con los clientes y ofrecer un servicio más rápido y eficaz. La personalización impulsada por la IA proporciona una ventaja competitiva al permitir a las empresas anticipar y satisfacer las necesidades de los clientes con una precisión y velocidad incomparables.',
      'fr':
          'Ne pas utiliser l’IA pour la personnalisation signifie manquer des opportunités clés pour adapter les documents et les interactions aux préférences individuelles des clients, une stratégie vitale pour améliorer l’engagement et le service. Cette surveillance limite la capacité à renforcer les relations avec les clients et à fournir un service plus rapide et plus efficace. La personnalisation basée sur l\'IA offre un avantage concurrentiel en permettant aux entreprises d\'anticiper et de répondre aux besoins des clients avec une précision et une rapidité inégalées.',
    },
    '82j5afmp': {
      'en': 'Costs of Compliance and Risk Management',
      'de': 'Kosten für Compliance und Risikomanagement',
      'es': 'Costos de cumplimiento y gestión de riesgos',
      'fr': 'Coûts de conformité et de gestion des risques',
    },
    '5ghyh8zq': {
      'en':
          'The absence of AI in compliance and risk management exposes businesses to increased non-compliance risks, including fines and reputational damage. AI significantly aids in aligning documents with relevant laws and regulations, minimizing the likelihood of such risks. Without AI, companies jeopardize their integrity and face potential regulatory penalties, underscoring the importance of AI for efficient compliance processes and safeguarding reputation.',
      'de':
          'Das Fehlen von KI im Compliance- und Risikomanagement setzt Unternehmen einem erhöhten Risiko der Nichteinhaltung aus, einschließlich Bußgeldern und Reputationsschäden. KI trägt erheblich dazu bei, Dokumente an relevante Gesetze und Vorschriften anzupassen und so die Wahrscheinlichkeit solcher Risiken zu minimieren. Ohne KI gefährden Unternehmen ihre Integrität und müssen mit potenziellen behördlichen Strafen rechnen. Dies unterstreicht die Bedeutung von KI für effiziente Compliance-Prozesse und den Schutz der Reputation.',
      'es':
          'La ausencia de IA en el cumplimiento y la gestión de riesgos expone a las empresas a mayores riesgos de incumplimiento, incluidas multas y daños a la reputación. La IA ayuda significativamente a alinear los documentos con las leyes y regulaciones relevantes, minimizando la probabilidad de tales riesgos. Sin IA, las empresas ponen en peligro su integridad y enfrentan posibles sanciones regulatorias, lo que subraya la importancia de la IA para procesos de cumplimiento eficientes y salvaguardar la reputación.',
      'fr':
          'L’absence d’IA dans la conformité et la gestion des risques expose les entreprises à des risques accrus de non-conformité, notamment des amendes et des atteintes à leur réputation. L’IA aide considérablement à aligner les documents sur les lois et réglementations pertinentes, minimisant ainsi la probabilité de tels risques. Sans IA, les entreprises mettent en péril leur intégrité et s’exposent à d’éventuelles sanctions réglementaires, ce qui souligne l’importance de l’IA pour des processus de conformité efficaces et pour préserver leur réputation.',
    },
    'd81ps195': {
      'en': 'Lost Innovation Opportunities Without AI Expertise',
      'de': 'Verlorene Innovationsmöglichkeiten ohne KI-Expertise',
      'es': 'Oportunidades de innovación perdidas sin experiencia en IA',
      'fr': 'Opportunités d’innovation perdues sans expertise en IA',
    },
    'trznrinu': {
      'en':
          'Companies cannot house experts for every field, but leveraging Virtual AI Experts offers them an invaluable opportunity to access a broad spectrum of expertise. These AI systems offer more than just operational efficiency; they are a source of continuous innovation, capable of identifying trends, generating ideas, suggesting improvements, and unlocking new possibilities. Without leveraging this intelligence, companies remain stagnant, overlooking the potential to revolutionize their products, services, and processes. ',
      'de':
          'Unternehmen können nicht für jedes Fachgebiet Experten unterbringen, aber der Einsatz von Virtual AI Experts bietet ihnen eine unschätzbare Gelegenheit, auf ein breites Spektrum an Fachwissen zuzugreifen. Diese KI-Systeme bieten mehr als nur betriebliche Effizienz; Sie sind eine Quelle kontinuierlicher Innovation, die in der Lage ist, Trends zu erkennen, Ideen zu generieren, Verbesserungen vorzuschlagen und neue Möglichkeiten zu erschließen. Ohne die Nutzung dieser Informationen bleiben Unternehmen stagnieren und übersehen das Potenzial, ihre Produkte, Dienstleistungen und Prozesse zu revolutionieren.',
      'es':
          'Las empresas no pueden albergar expertos para todos los campos, pero aprovechar Virtual AI Experts les ofrece una oportunidad invaluable de acceder a un amplio espectro de experiencia. Estos sistemas de IA ofrecen más que solo eficiencia operativa; son una fuente de innovación continua, capaz de identificar tendencias, generar ideas, sugerir mejoras y desbloquear nuevas posibilidades. Sin aprovechar esta inteligencia, las empresas permanecen estancadas y pasan por alto el potencial de revolucionar sus productos, servicios y procesos.',
      'fr':
          'Les entreprises ne peuvent pas héberger des experts dans chaque domaine, mais tirer parti des experts virtuels en IA leur offre une opportunité inestimable d’accéder à un large spectre d’expertise. Ces systèmes d’IA offrent bien plus qu’une simple efficacité opérationnelle ; ils sont une source d\'innovation continue, capables d\'identifier les tendances, de générer des idées, de suggérer des améliorations et d\'ouvrir de nouvelles possibilités. Sans tirer parti de cette intelligence, les entreprises stagnent, négligeant le potentiel de révolutionner leurs produits, services et processus.',
    },
    '7an5yan4': {
      'en':
          'Empower Your Business with Virtual AI Experts: Seize the Competitive Advantage',
      'de':
          'Stärken Sie Ihr Unternehmen mit virtuellen KI-Experten: Nutzen Sie den Wettbewerbsvorteil',
      'es':
          'Potencie su negocio con expertos en IA virtual: aproveche la ventaja competitiva',
      'fr':
          'Renforcez votre entreprise avec des experts en IA virtuelle : profitez de l\'avantage concurrentiel',
    },
    'ym5mvk53': {
      'en': 'Efficiency Reimagined',
      'de': 'Effizienz neu gedacht',
      'es': 'Eficiencia reinventada',
      'fr': 'L\'efficacité réinventée',
    },
    'vhmin264': {
      'en':
          'Our Virtual AI Experts cut through the complexity of document management, saving you time and allowing you to focus on what you do best - growing your business.',
      'de':
          'Unsere virtuellen KI-Experten durchbrechen die Komplexität des Dokumentenmanagements, sparen Ihnen Zeit und ermöglichen Ihnen, sich auf das zu konzentrieren, was Sie am besten können – das Wachstum Ihres Unternehmens.',
      'es':
          'Nuestros expertos virtuales en IA eliminan la complejidad de la gestión de documentos, ahorrándole tiempo y permitiéndole centrarse en lo que mejor sabe hacer: hacer crecer su negocio.',
      'fr':
          'Nos experts en IA virtuelle éliminent la complexité de la gestion des documents, vous faisant gagner du temps et vous permettant de vous concentrer sur ce que vous faites le mieux : développer votre entreprise.',
    },
    '9o0uuhpq': {
      'en': 'Clarity Through Data',
      'de': 'Klarheit durch Daten',
      'es': 'Claridad a través de los datos',
      'fr': 'Clarté grâce aux données',
    },
    'mb1bbjc5': {
      'en':
          'Make smarter decisions faster. Virtual AI Experts turn data chaos into actionable insights, providing you with the clarity needed to lead in your market.',
      'de':
          'Treffen Sie schneller intelligentere Entscheidungen. Virtuelle KI-Experten verwandeln das Datenchaos in umsetzbare Erkenntnisse und verschaffen Ihnen die nötige Klarheit, um in Ihrem Markt führend zu sein.',
      'es':
          'Tome decisiones más inteligentes y más rápido. Los expertos en IA virtual convierten el caos de datos en conocimientos prácticos, proporcionándole la claridad necesaria para liderar su mercado.',
      'fr':
          'Prenez des décisions plus intelligentes plus rapidement. Les experts en IA virtuelle transforment le chaos des données en informations exploitables, vous offrant ainsi la clarté nécessaire pour dominer votre marché.',
    },
    'nk7ph3at': {
      'en': 'AI-Accelerated Growth Beyond Boundaries',
      'de': 'KI-beschleunigtes Wachstum über Grenzen hinaus',
      'es': 'Crecimiento acelerado por IA más allá de los límites',
      'fr': 'Croissance accélérée par l’IA au-delà des frontières',
    },
    'jfplp0fj': {
      'en':
          'Grow without constraints. Our scalable solutions by Virtual AI Experts handle your expanding needs effortlessly, ensuring you’re always ahead of the curve.',
      'de':
          'Wachsen Sie ohne Einschränkungen. Unsere skalierbaren Lösungen von Virtual AI Experts bewältigen Ihre wachsenden Anforderungen mühelos und stellen sicher, dass Sie immer einen Schritt voraus sind.',
      'es':
          'Crecer sin restricciones. Nuestras soluciones escalables de expertos virtuales en IA manejan sus crecientes necesidades sin esfuerzo, garantizando que siempre esté a la vanguardia.',
      'fr':
          'Grandissez sans contraintes. Nos solutions évolutives conçues par des experts en IA virtuelle répondent sans effort à vos besoins croissants, vous garantissant ainsi d’avoir toujours une longueur d’avance.',
    },
    'wdo2361q': {
      'en': 'Stand Out in the Market',
      'de': 'Heben Sie sich vom Markt ab',
      'es': 'Destaca en el mercado',
      'fr': 'Démarquez-vous sur le marché',
    },
    'itlbacf2': {
      'en':
          'Gain a sharp competitive edge. Virtual AI Experts give you the precision tools to carve out a market niche, ensuring your business is seen and remembered.',
      'de':
          'Verschaffen Sie sich einen deutlichen Wettbewerbsvorteil. Virtuelle KI-Experten geben Ihnen die Präzisionswerkzeuge an die Hand, um eine Marktnische zu erobern und sicherzustellen, dass Ihr Unternehmen gesehen und im Gedächtnis bleibt.',
      'es':
          'Obtenga una clara ventaja competitiva. Los expertos en IA virtual le brindan las herramientas de precisión para crear un nicho de mercado, garantizando que su negocio sea visto y recordado.',
      'fr':
          'Bénéficiez d’un avantage concurrentiel marqué. Les experts en IA virtuelle vous fournissent les outils de précision nécessaires pour vous tailler une niche de marché, garantissant ainsi que votre entreprise soit vue et mémorisée.',
    },
    'jvxs31d6': {
      'en': 'Experience Personalization',
      'de': 'Erleben Sie Personalisierung',
      'es': 'Personalización de la experiencia',
      'fr': 'Expérimentez la personnalisation',
    },
    'b31kmy32': {
      'en':
          'Elevate your customer interactions. We create personalized experiences that feel as special and unique as your business, enhancing loyalty and satisfaction.',
      'de':
          'Steigern Sie Ihre Kundeninteraktionen. Wir schaffen personalisierte Erlebnisse, die sich so besonders und einzigartig anfühlen wie Ihr Unternehmen und so die Loyalität und Zufriedenheit steigern.',
      'es':
          'Eleve las interacciones con sus clientes. Creamos experiencias personalizadas que se sienten tan especiales y únicas como su negocio, potenciando la lealtad y la satisfacción.',
      'fr':
          'Améliorez vos interactions avec vos clients. Nous créons des expériences personnalisées qui semblent aussi spéciales et uniques que votre entreprise, améliorant ainsi la fidélité et la satisfaction.',
    },
    'zsj50t89': {
      'en': 'Collaborate with Ease',
      'de': 'Mit Leichtigkeit zusammenarbeiten',
      'es': 'Colabora con facilidad',
      'fr': 'Collaborez en toute simplicité',
    },
    'y6nf2u4r': {
      'en':
          'Achieve harmony in teamwork. Virtual AI Experts facilitate a collaborative culture that transcends distances, connecting your team for peak performance.',
      'de':
          'Erreichen Sie Harmonie in der Teamarbeit. Virtuelle KI-Experten ermöglichen eine Kultur der Zusammenarbeit, die über Entfernungen hinweggeht und Ihr Team für Spitzenleistungen verbindet.',
      'es':
          'Lograr la armonía en el trabajo en equipo. Los expertos en IA virtual facilitan una cultura colaborativa que trasciende las distancias y conecta a su equipo para lograr el máximo rendimiento.',
      'fr':
          'Atteindre l’harmonie dans le travail d’équipe. Les experts virtuels en IA facilitent une culture collaborative qui transcende les distances, connectant votre équipe pour des performances optimales.',
    },
    'rk3ehucp': {
      'en': 'Uncompromised Compliance',
      'de': 'Kompromisslose Compliance',
      'es': 'Cumplimiento sin compromisos',
      'fr': 'Conformité sans compromis',
    },
    '8fob09pr': {
      'en':
          'Stay protected. Our Virtual AI Experts are an additional layer of defense against compliance risks, safeguarding your reputation and giving you peace of mind.',
      'de':
          'Bleiben Sie geschützt. Unsere virtuellen KI-Experten sind eine zusätzliche Verteidigungsebene gegen Compliance-Risiken, schützen Ihren Ruf und geben Ihnen Sicherheit.',
      'es':
          'Manténgase protegido. Nuestros expertos virtuales en IA son una capa adicional de defensa contra los riesgos de cumplimiento, salvaguardando su reputación y brindándole tranquilidad.',
      'fr':
          'Restez protégé. Nos experts virtuels en IA constituent une couche de défense supplémentaire contre les risques de non-conformité, protégeant votre réputation et vous procurant une tranquillité d\'esprit.',
    },
    'jvyitni3': {
      'en': 'Innovation at Your Fingertips',
      'de': 'Innovation zum Anfassen',
      'es': 'Innovación a tu alcance',
      'fr': 'L\'innovation à portée de main',
    },
    '2z7pvvs0': {
      'en':
          'Spark creativity and innovation. Virtual AI Experts bring fresh, actionable ideas to the surface, propelling your business forward into new realms of possibility.',
      'de':
          'Fördern Sie Kreativität und Innovation. Virtuelle KI-Experten bringen frische, umsetzbare Ideen an die Oberfläche und treiben Ihr Unternehmen in neue Bereiche der Möglichkeiten voran.',
      'es':
          'Despierta la creatividad y la innovación. Los expertos en IA virtual sacan a la superficie ideas nuevas y prácticas, impulsando su negocio hacia nuevos ámbitos de posibilidades.',
      'fr':
          'Stimulez la créativité et l’innovation. Les experts en IA virtuelle font émerger des idées nouvelles et exploitables, propulsant votre entreprise vers de nouveaux domaines de possibilités.',
    },
    'k3iunniv': {
      'en': 'Redefine Customer Service',
      'de': 'Definieren Sie Kundenservice neu',
      'es': 'Redefinir el servicio al cliente',
      'fr': 'Redéfinir le service client',
    },
    '0pbplxwt': {
      'en':
          'Set new service standards. Virtual AI Experts ensure that every customer interaction is responsive, personalized, and reassuring, elevating your customer service to new heights.',
      'de':
          'Setzen Sie neue Servicestandards. Virtuelle KI-Experten stellen sicher, dass jede Kundeninteraktion reaktionsschnell, personalisiert und beruhigend ist, und heben Ihren Kundenservice auf ein neues Niveau.',
      'es':
          'Establecer nuevos estándares de servicio. Los expertos en IA virtual garantizan que cada interacción con el cliente sea receptiva, personalizada y tranquilizadora, elevando su servicio al cliente a nuevas alturas.',
      'fr':
          'Établissez de nouvelles normes de service. Les experts en IA virtuelle veillent à ce que chaque interaction client soit réactive, personnalisée et rassurante, élevant ainsi votre service client vers de nouveaux sommets.',
    },
  },
  // Miscellaneous
  {
    '5x4vkodj': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'btm3h7j4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6f6qcrch': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zkspkfdr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'h3tluypr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7etrqlv8': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dnub7fv3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'z18kqv1t': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zh3gid58': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mmsko3ir': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'd2wp2g05': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5hho5jcr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7lh4ytao': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '10d1yald': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'gyqsrp5r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q069pjmo': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '475svida': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lmh7m7yl': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x4gl5jzq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7oob3gve': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9z8mdx9k': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q9ahmzl4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ky03jm0b': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8zlse8ry': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8oeco7m7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

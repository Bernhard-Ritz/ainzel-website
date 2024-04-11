import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'privacy_statement_model.dart';
export 'privacy_statement_model.dart';

class PrivacyStatementWidget extends StatefulWidget {
  const PrivacyStatementWidget({super.key});

  @override
  State<PrivacyStatementWidget> createState() => _PrivacyStatementWidgetState();
}

class _PrivacyStatementWidgetState extends State<PrivacyStatementWidget> {
  late PrivacyStatementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyStatementModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 300.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 700.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 700.0;
        } else {
          return 700.0;
        }
      }(),
      height: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 600.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 700.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 700.0;
        } else {
          return 700.0;
        }
      }(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'wlrqzv76' /* Privacy Statement */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF1D4479),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'nvwkcvia' /* effective as of April 02, 2024 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PRIVACY_STATEMENT_Icon_u5hyezlb_ON_TAP');
                      logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
              child: Container(
                width: 600.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2.0, 12.0, 2.0, 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: MarkdownBody(
                              data:
                                  '''At Ainzel, trust is our number one value. This Privacy Statement describes how Ainzel collects, uses, shares or otherwise processes information relating to individuals (“Personal Data”) and the rights associated with that processing.
## 1. Responsible Ainzel entity
Ainzel, Inc. and/or its affiliated entities (“Ainzel, “we”, “us”, or the “Company”) are responsible for the processing of your Personal Data as described in this Privacy Statement, unless specified otherwise, and act as the controller of such Personal Data.
This Privacy Statement does not apply to the extent we process Personal Data in the role of a processor or service provider on behalf of our customers, including where we offer to our customers various products and services through which our customers (or their affiliates): (i) create their own websites and applications running on our platforms; (ii) sell or offer their own products and services; (iii) send electronic communications to others; or (iv) otherwise collect, use, share or process Personal Data via our products and services.
For detailed privacy information related to a Ainzel customer or a customer affiliate who uses Ainzel products and services as the controller, please contact our customer directly. We are not responsible for the privacy or data security practices of our customers, which may differ from those explained in this Privacy Statement. For more information, please also see Section 10.3 below.
## 2. Processing activities covered
 This Privacy Statement applies to the processing of Personal Data collected by us when you:
 * Visit our websites that display or link to this Privacy Statement; 
 * Visit our branded social media pages;
 * Visit our offices; 
 * Receive communications from us or otherwise communicate with us, including but not limited to emails, phone calls, texts or faxes;
 * Use our products and services where we act as a controller of your Personal Data;
 * Register for, attend or take part in our events, webinars, programs, trainings, certifications or contests;
 * Act as or work for a service provider or supplier to Ainzel, to the extent Ainzel acts as a controller with respect to your Personal Data;
 * Are employed by a customer of our products and services where your information has been shared with us in our capacity as a controller (for example, during the contracting process); 
 * Participate in a Ainzel community; or
 * Participate in surveys, research or other similar data collection facilitated by us.

We also host online marketplaces. When offerings on these marketplaces are provided by third parties, the privacy statement of the third party applies and this Privacy Statement does not. 
Our websites and services may contain links to other websites, applications, platforms and services maintained by third parties. The information practices of these third parties, including the social media platforms that host our branded social media pages, are governed by their privacy statements, which you should review to better understand their privacy practices.
In some circumstances, we also collect, or our partners provide us with, publicly available information which may contain Personal Data that you have published or that has been made available online. The way in which our partners collect this is detailed in their own privacy policies, available on their websites.
 ## 3. What Personal Data do we collect?
### 3.1 Personal Data we collect directly from you
The Personal Data we collect directly from you may include identifiers, professional or employment-related information, financial account information, commercial information, visual information, and internet activity information, among others. We may collect such information in the following situations:
| Situations | Categories of Personal Data | 
| -- | -- | 
| If you express an interest in obtaining additional information about our services; request customer support (including accessing the Help & Training Portal); use our “Contact Us” or similar features; register to use our websites or to receive communications; sign up for an event, webinar or contest; participate in a program, training, certification or survey; use our products and services; download certain content; or are employed by a customer of our products and services where your information has been shared with us	| Contact information, such as your name, job title, company name, address, phone number, email address, username and password, other information you have voluntarily chosen to share
| If you make purchases via our websites or register for an event or webinar | Contact information, financial and billing information, such as billing name and address, credit card number or bank account information | 
| If you attend an event | Attendee badge information which may include name, title, company name, address, country, phone number and email address, image and video | 
| If you give your explicit consent and only for specified events, your biometric information, such as an image of your facial features for identification purposes | During the Covid-19 pandemic, this may also include health status, including your temperature, COVID-19-related symptoms, exposure to COVID-19 positive individuals, vaccination status, testing results, and recent travel history | 
| If you register with us for a variety of purposes, including joining a community that we host or participating in a program, training or certification | Username, photo, video or other biographical information, such as your occupation, location, social media profiles or usernames, company name, areas of expertise and interests | 
| If you interact with our websites or emails | Information about your device and your usage of our websites or emails (such as Internet Protocol (IP) addresses or other identifiers), which may qualify as Personal Data (please see Section 4 below) using cookies, web beacons, or similar technologies | 
| If you use and interact with our products and services | Information about your device and your usage of our services through log files and other technologies, some of which may qualify as Personal Data (including Usage Data) (please see Section 4 below) | 
| If you communicate with us via a phone call | Information such as your name, voice and any other Personal Data voluntarily share | 
| If you visit our offices	| Name, email address, phone number, company name, time and date of arrival, image or video. During the Covid-19 pandemic, this may also include health status, including your temperature, COVID-19-related symptoms, exposure to COVID-19 positive individuals, vaccination status, testing results, and recent travel history| 
| If you voluntarily submit certain information to us, such as filling out a survey, responding to a questionnaire or participating in other forms of research	| Information you have provided as part of that request, which may include Personal Data and special categories of Personal Data, to the extent you voluntarily choose to provide it | 
| If you are a supplier or service provider to Ainzel (or work for a supplier or service provider)	| Contact information, payment and billing information | 
 
If you provide us, our service providers or our affiliates with any Personal Data relating to other individuals, you represent that you have the authority to do so, and where required, have obtained the necessary consent, and acknowledge that it may be used in accordance with this Privacy Statement. If you believe that your Personal Data has been provided to us improperly, or want to exercise your rights relating to your Personal Data, please contact us by using the information in Section 13 below.
### 3.2 Personal Data we collect from other sources
We also collect information about you from other sources including partners from whom we collect or purchase Personal Data or who provide us with publicly available information which may contain Personal Data. We may combine this information with Personal Data provided by you.
Provision of the services:
 * The Personal Data we collect to provide our products and services may include information you have made publicly available online (such as when using social media sites) or that is published by third parties and contains information about you (such as news articles). For a select number of services, we collect this Personal Data from partners who may receive this data when you visit or use their services or through the third parties they work with.
 * In addition, the Personal Data we collect to provide our products and services may include location information from third parties, which helps us offer features like identity management and multi-factor authentication.
Advertising: The Personal Data we collect from other sources for the purposes of tailored advertising includes identifiers, professional or employment-related information, education information, commercial information, visual information, internet activity information, and inferences about preferences and behaviors. We, collect this from third party providers of business contact information, including mailing addresses, job titles, email addresses, phone numbers, intent data (or user behavior data), IP addresses, social media profiles, LinkedIn URLs and custom profiles for purposes of targeted advertising, delivering relevant email content, event promotion and profiling, determining eligibility and verifying contact information. This helps us update, expand, and analyze our records, identify new customers, and create more tailored advertising to provide services that may be of interest to you.
Additional sources: In addition to the aforementioned, we collect Personal Data from the following sources:
 * Another individual at your organization who may provide us with your personal information, which may include Personal Data and special categories of Personal Data, to the extent you consent to providing it and sharing it, for the purposes of obtaining services and assessing our goals related to encouraging diversity within our vendors; and 
 * Platforms such as GitHub to manage code check-ins and pull requests. If you participate in an open-source or community development project, we may associate your code repository username with your community account so we can inform you of program changes that are important to your participation or relate to additional security requirements.
 * Only where necessary for security purposes, we may collect information that is publicly available online (such as accessible through search engines or public social media sites), as well as images, physical descriptions and other pertinent information necessary to address a credible security threat to our employees, events or premises.
## 4. What Device and Usage Data do we process?
We use common information-gathering tools, such as tools for collecting data, cookies, web beacons, pixels, and similar technologies to collect information that may contain Personal Data as you navigate our websites, our services, or interact with emails we have sent to you.
### 4.1 Device and Usage Data
As is true of most websites, we gather certain device information when individual users visit our websites. This information may include identifiers, commercial information, and internet activity information such as IP address (or proxy server information), device and application information, identification numbers and features, location, browser type, plug-ins, integrations, Internet service provider, mobile carrier, the pages and files viewed, searches, referring website, app or ad, operating system, system configuration information, advertising and language preferences, date and time stamps associated with your usage, and frequency of visits to the websites. This information is used for the purposes set out in section 5 of this Privacy Statement below. 
In addition, we gather certain information as part of your use of our products and services (“Usage Data”). This information may include: (i) identifiers, such as user ID, organization ID, username, email address and user type; (ii) commercial information; and (iii) internet activity information such as IP address (or proxy server), mobile device number, device and application identification numbers, location, language, browser type, Internet service provider or mobile carrier, user interactions such as the pages and files viewed, website and webpage interactions including searches and other actions you take, operating system type and version, system configuration information, date and time stamps associated with your usage and details of which of our products and product versions you are using. This information is used for the purposes set out in detail in section 5 of this Privacy Statement below. In addition, we may use aggregated Usage Data for other internal business purposes, such as to identify additional customer opportunities and to ensure that we are meeting the demands of our customers and their users. Please note that this Usage Data is primarily used to identify the uniqueness of each user logging on (as opposed to specific individuals), apart from where it is strictly required to identify an individual for security purposes or as required as part of our provision of the services to our customers. 
### 4.2 Cookies, web beacons and other tracking technologies on our website and in email communications
We use technologies such as web beacons, pixels, tags, and JavaScript, alone or in conjunction with cookies, to gather information about the use of our websites and how people interact with our emails.
When you visit our websites, we, or an authorized third party, may place a cookie on your device that collects information, including Personal Data, about your online activities over time and across different sites. Cookies allow us to track use, infer browsing preferences, and improve and customize your browsing experience.
We use both session-based and persistent cookies on our websites. Session-based cookies exist only during a single session and disappear from your device when you close your browser or turn off the device. Persistent cookies remain on your device after you close your browser or turn your device off. To change your cookie settings and preferences for one of our websites, click the Cookie Preferences link in the footer of the page. You can also control the use of cookies on your device, but choosing to disable cookies on your device may limit your ability to use some features on our websites and services.
We also use web beacons and pixels on our websites and in emails. For example, we may place a pixel in a marketing email that notifies us when you click on a link in the email. We use these technologies to operate and improve our websites and marketing emails. – please see more details in the “Advertising Cookies” row in the table below. For instructions on how to unsubscribe from our marketing emails, please see Section 10.4 below.
The following describes how we use different categories of cookies and similar technologies and your options for managing the data collection settings of these technologies:
| Type of Cookies	| Description	| Managing Settings | 
| -- | -- | -- |  
| Required cookies	| Required cookies are necessary for basic website functionality. Some examples include: session cookies needed to transmit the website, authentication cookies, and security cookies. | If you have chosen to identify yourself to us, we may place on your browser a cookie that allows us to uniquely identify you when you are logged into the websites and to process your online transactions and requests.	Because required cookies are essential to operate the websites, there is no option to opt out of these cookies. | 
| Functional cookies | Functional cookies enhance functions, performance, and services on the website. Some examples include: cookies used to analyze site traffic, cookies used for market research, and cookies used to display advertising that is not directed to a particular individual.. Functional cookies may also be used to improve how our websites function and to help us provide you with more relevant communications, including marketing communications. These cookies collect information about how our websites are used, including which pages are viewed most often. We may use our own technology or third-party technology to track and analyze usage information to provide enhanced interactions and more relevant communications, and to track the performance of our advertisements.Ainzel may also use HTML5 local storage or Flash cookies for the above-mentioned purposes. These technologies differ from browser cookies in the amount and type of data they store, and how they store it. | We need your prior consent to use functional cookies. To change your cookie settings and preferences, including those for functional cookies, click the Cookie Preferences link in the footer of the page. | 
| Advertising cookies | Advertising cookies track activity across websites in order to understand a viewer’s interests and to direct marketing to them. We sometimes use cookies delivered by us or by third parties to show you ads for our products that we think may interest you on devices you use and to track the performance of our advertisements. For example, these cookies collect information such as which browser you used when visiting our websites. Ainzel also contracts with third-party advertising networks that collect IP addresses and other information from web beacons on our websites, from emails and on third-party websites. Advertising networks follow your online activities over time and across different websites or other online services by collecting certain data through automated means, including through the use of cookies. These technologies may recognize you across the different devices you use. When we work with third party advertising networks, we require them to restrict their data processing to only what is necessary to provide us with the advertising services we request. | We need your prior consent to use of targeting and advertising cookies. To change your cookie settings and preferences, including those for targeting and advertising cookies, click the Cookie Preferences link in the footer of the page. See Section 4.3, below, to learn more about these and other advertising networks and your ability to opt out of collection by certain third parties. | 
 
### 4.3 Notices on behavioral advertising and opt-out for website visitors
As described above, we or one of our authorized partners may place or read cookies on your device when you visit our websites for the purpose of serving you targeted advertising (also referred to as “online behavioral advertising” or “interest-based advertising”). 
To manage the use of targeting and advertising cookies on this website, click the Cookie Preferences link in the footer of the page or consult your individual browser settings for cookies. Various browsers may also offer their own management tools for removing HTML5 local storage. 
 
### 4.4 Opt-Out from the setting of cookies on your individual browser
In many cases you may opt-out from the collection of non-essential device data on your web browser (see Section 4.1 above) by managing your cookies at the browser or device level. Please note, however, that by blocking or deleting cookies and similar technologies used on our websites, you may not be able to take full advantage of the websites.
While some internet browsers offer a “do not track” or “DNT” option that lets you tell websites that you do not want to have your online activities tracked, these features are not yet uniform and there is no common standard adopted by industry groups, technology companies, or regulators. Therefore, we do not currently commit to responding to browsers’ DNT signals with respect to our websites. Ainzel takes privacy and meaningful choice seriously and will make efforts to continue to monitor developments around DNT browser technology and the implementation of a standard.
### 4.5 Social Media Features
Our websites may use social media features, such as the “Tweet” button and other sharing widgets (“Social Media Features”). Social Media Features may allow you to post information about your activities on our website to outside platforms and social networks. Social Media Features may also allow you to like or highlight information we have posted on our website or our branded social media pages. Social Media Features are either hosted by each respective platform or hosted directly on our website. To the extent the Social Media Features are hosted by the platforms themselves, and you click through to these from our websites, the platform may receive information showing that you have visited our websites. If you are logged in to your social media account, it is possible that the respective social media network can link your visit to our websites with your social media profile.
Ainzel also allows you to log in to certain of our websites using sign-in services. These services authenticate your identity and provide you the option to share certain Personal Data from these services with us such as your name and email address to pre-populate our sign-up form.
Your interactions with Social Media Features are governed by the privacy policies of the companies providing them.
### 4.6 Telephony log information
If you use certain features of our services on a mobile device, we may also collect telephony log information (like phone numbers, time and date of calls, duration of calls, SMS routing information and types of calls), device event information (such as crashes, system activity, hardware settings, browser language), and location information (through IP address, GPS, and other sensors that may, for example, provide us with information on nearby devices, Wi-Fi access points and cell towers).
## 5. Purposes for which we process Personal Data and the legal bases on which we rely
We collect and process your Personal Data (including, where legally permissible, special categories of Personal Data) for the following purposes and relying on the following legal bases:
| Purpose | Description | Legal basis |
| -- | -- | --  |
| Providing our websites (including our social media pages)	 | We process your Personal Data to operate and administer our websites and to provide you with the content you access and request 	 | Our legitimate interest in providing online content to our customers and prospective customers regarding our service offering and related information
 Improving our websites|  We process your Personal Data to analyze overall trends and help us improve the user experience on our websites | Our legitimate interest in providing a relevant and well-functioning website for the benefit of our website visitors | 
| Promoting the security of our websites | We process your Personal Data by tracking use of our websites and verifying and investigating activity | Our legitimate interest in promoting the safety and security of our websites and in protecting our rights and the rights of others | 
| Displaying personalized advertisements and content | We process your Personal Data to conduct market research, advertise to you, provide personalized information about us on and off our websites and to provide other personalized content based upon your activities and interests | Our legitimate interest in advertising our products and services or, where necessary, to the extent you have provided your prior consent. Please see Section 10 below, to learn how you can control the processing of your Personal Data by Ainzel for personalized advertising purposes
 | Registering visitors 	| We process your Personal Data, including registration information and associated non-disclosure information, for security reasons	| Our legitimate interest in protecting our offices, staff, visitors and our confidential information against unauthorized access | 
| Managing event registrations and attendance | We process your Personal Data to plan and host events or webinars for which you have registered or that you attend, including sending related communications to you |  Where you explicitly consent, we also may process your biometric Personal Data to facilitate event registration and for security reasons	Performance of a contract or where we receive your explicit consent | 
| Ensuring the health of our visitors and employees | We process your Personal Data (which may include special categories of Personal Data) (where legally permitted) during office visits and at events during the COVID-19 pandemic to ensure the health and safety of our visitors and employees  |  Consent and explicit consent or in our legitimate interest to ensure the health of our employees and visitors where necessary for reasons of public interest in the area of public health | 
| Ensuring the safety and security of our employees, events and premises | We process your Personal Data where necessary based on a credible threat to our employees, events or premises | Our legitimate interest in protecting our employees, events and premises | 
| Sending communications | We process your Personal Data to send you marketing information, product recommendations and other non-transactional communications (e.g., marketing newsletters, telemarketing calls, SMS or push notifications, information about our products, news or events) about us, our affiliates and partners | Our legitimate interest in conducting direct marketing or where you have provided your prior consent (please see Section 10 below to learn how you can control the processing of your Personal Data by Ainzel for marketing purposes)| 
| Recording phone calls	| We process your Personal Data, including recording phone calls (in accordance with applicable laws) for training, quality assurance, and administration purposes | If required under applicable law, we will give you the option to object to a call being recorded	Consent or our legitimate interest in maintaining the high quality of our phone calls with users | 
| Handling contact and user support requests | We process your Personal Data, if you fill out a “Contact Me” web form or request user support, or if you contact us by other means including but not limited to via phone | Necessary for the performance of a contract or our legitimate interest in fulfilling your requests and communicating with you | 
| Providing our services  | We process your Personal Data to perform our contract with you for the provision of our services and to satisfy our obligations under the applicable terms of use | Necessary for the performance of a contract or our legitimate interest to provide and administer our services | 
| Developing and optimizing the performance of the services	| We process your Personal Data to develop, optimize, and improve the performance of the services | Legitimate interest to develop services and ensure that the services are performing in line with customer expectations; if special categories of Personal Data are processed, where the Personal Data is manifestly made public by the data subject | 
| Providing personalized interactions | We process your Personal Data to customize our interactions with you | Legitimate interest to offer the best-in class services to our customers| 
| Managing our customer and user accounts | We process your Personal Data (including Usage Data) to manage customer and user accounts generally, such as billing, customer correspondence and customer relationship management | Necessary for the performance of a contract or our legitimate interest in the management of customer and user accounts | 
| Managing usage and licensing compliance | We process your Personal Data (including Usage Data) to assess and manage usage and licensing compliance with the applicable terms of use of our services | Necessary for the performance of a contract or our legitimate interest in managing the provision of our services to customers | 
| Preparing internal reports and business modeling 	| We process your Personal Data (including Usage Data) for internal reporting and business modeling purposes (e.g., forecasting, revenue, capacity planning, product strategy) | Our legitimate interest in the management of our business operations | 
| Maintaining our security | We process your Personal Data (including your Usage Data) for the purposes of maintaining Ainzel’s own security, including investigating, detecting and preventing suspicious activity, fraud and cybercrime that may affect Ainzel or its services | Our legitimate interest in promoting the safety and security of Ainzel generally and to protect our rights and the rights of others | 
| Managing compensation for employees  | We process your Personal Data (including your Usage Data) for the purposes of determining compensation for Ainzel employees, such as commission | Necessary for the performance of a contract with an employee or our legitimate interest in fairly compensating our employees | 
| Undertaking financial reporting 	| We process your Personal Data (including your Usage Data) for the purposes of financial reporting	| Our legitimate interest in meeting our obligations associated with the reporting of our finances | 
| Aggregating data	| We process your Personal Data (including your Usage Data) for the purposes of aggregating this information to ensure that it is no longer identifying	| Our legitimate interest in minimizing the amount of Personal Data processed as part of the noted processing activity |   
| Managing, and participating in, webinars, contests, programs, training, certifications or promotions	| We process your Personal Data if you register for a webinar, contest, promotion, training, certification or a program. In some cases where the training or certification is through your employer, we will share your Personal Data with your employer. | Some webinars, contests, programs, trainings, certifications and promotions have additional rules containing information about how we will process your Personal Data	Consent, necessary for the performance of a contract or our legitimate interest in providing the webinar, contest, promotion, training, certification or promotion | 
| Managing payments	| If you have provided financial information to us, we process your Personal Data to verify that information and to collect payments to the extent that doing so is necessary to complete a transaction and perform our contract with you	| Necessary for the performance of a contract | 
| Administering surveys and conducting research	| We process your Personal Data (including, where legally permitted, special categories of Personal Data) in order to meet the goals set out in surveys or research as well as to analyze our compliance with internal policies	| Consent or explicit consent (if required under applicable law) or our legitimate interest in conducting the survey or research based on its stated goals (where no special categories of Personal Data are in scope) | 
| Participating in a Ainzel community, such as that focused on open-source development 	| We process your Personal Data, such as your username associated with your community account, in order to host and maintain the community for the benefit of its members	| Our legitimate interest in hosting and maintaining such a community for the benefits of its members, as well as in order to inform you of program changes that are important to your participation or relate to additional security measures | 
| Collecting diversity information | We process your Personal Data (including special categories of Personal Data) to the extent you voluntarily consent to provide it to meet our broader community goals related to diversity and equality of opportunity | Consent or explicit consent (if required under applicable law) | 
| Complying with legal obligations | We process your Personal Data (including Usage Data) when cooperating with public and government authorities, courts or regulators in accordance with our legal obligations under applicable laws to the extent this requires the processing or disclosure of Personal Data to protect our rights	| Legal obligation or our legitimate interest in protecting against misuse or abuse of our websites or services, protecting personal property or safety, pursuing remedies available to us and limiting our damages, complying with judicial proceedings, court orders or legal processes, responding to lawful requests, or for auditing purposes | 

If we need to collect and process Personal Data by law, or under a contract we have entered into with you, and you fail to provide the required Personal Data when requested, we may not be able to perform our contract with you.
## 6. Who do we share Personal Data with?
We may share your Personal Data as follows:
 * Service providers: With our contracted service providers, who provide services such as IT and system administration and hosting, credit card processing, research and analytics, marketing, events planning, customer support and data enrichment for the purposes and pursuant to the legal bases described above in Section 5. Contracted service providers may also deliver artificial intelligence and generative artificial intelligence capabilities to analyze data, determine trends, make predictions and create AI-generated responses or other content for the purposes and pursuant to the legal bases described above in Section 5; 
 * Ainzel affiliates: With affiliates within the Ainzel corporate group and companies that we acquire in the future after they are made part of the Ainzel corporate group, to the extent such sharing of data is necessary to fulfill a request you have submitted via our websites or for customer support, marketing, technical operations, event registration and account management purposes. 
 * Event sponsors: If you attend an event or webinar organized by us, or download or access an asset on our website, we may share your Personal Data with sponsors of the event. If required by applicable law, you may consent to such sharing via the registration form or by allowing your attendee badge to be scanned at a sponsor booth. In these circumstances, your information will be subject to the sponsors’ privacy statements. If you do not wish for your information to be shared, you may choose to not opt-in via event/webinar registration or elect to not have your badge scanned, or you can opt-out in accordance with Section 10 below;
 * Partners: With specific partners that offer supplementary services to those provided by Ainzel, such as partners that offer sustainability resources, or that resell Ainzel services, to the extent you consent to such sharing (where required by applicable law);
 * Customers with whom you are affiliated and the applicable partner responsible for access to your services: If you use our services as an authorized user, we may share your Personal Data with your affiliated customer and/or the applicable partner responsible for your access to the services to the extent this is necessary for verifying accounts and activity, investigating suspicious activity, or enforcing our terms and policies; 
 * Contest and promotion sponsors: With sponsors of contests or promotions for which you register in order to fulfill the contest or promotion;
 * Third party networks and websites: With third-party social media networks, advertising networks and websites, so that Ainzel can market and advertise on third party platforms and websites;
 * Professional advisers: In individual instances, we may share your Personal Data with professional advisers acting as service providers, processors, or joint controllers - including lawyers, bankers, auditors, and insurers who provide consultancy, banking, legal, insurance and accounting services, and to the extent we are legally obliged to share or have a legitimate interest in sharing your Personal Data;
 * Third parties involved in a corporate transaction: If we are involved in a merger, reorganization, dissolution or other fundamental corporate change, or sell a website or business unit, or if all or a portion of our business, assets or stock are acquired by a third party. In accordance with applicable laws, we will use reasonable efforts to notify you of any transfer of Personal Data to an unaffiliated third party;
 * Third party accounts: If you connect to your third party accounts through our products, we will use that information to authenticate you, enumerate the data sources available to you, download any data you request us to, and download and refresh authentication tokens or persist authentication information such as user names and passwords as necessary to continue to connect to these data; and
 * Public authorities: With public and government authorities, to the extent we are compelled to disclose Personal Data to comply with our legal obligations.
We may also share aggregated Usage Data with Ainzel’s service providers for the purpose of helping Ainzel in such analysis and improvements. Additionally, Ainzel may share Usage Data on an aggregate basis in the normal course of operating our business; for example, we may share information publicly to show trends about the general use of our services.
Anyone using our communities, forums, blogs, or chat rooms on our websites may read any Personal Data or other information you choose to submit and post.
For more information on the recipients of your Personal Data, please contact us by using the information in Section 13 below.
## 7. International transfer of Personal Data
Your Personal Data may be collected, transferred to and stored by us in the United States and by our affiliates and third-parties disclosed in Section 6, above, that are based in other countries.
Therefore, your Personal Data may be processed outside your country or jurisdiction, including in places that are not subject to an adequacy decision by the European Commission or your local legislature or regulator, and that may not provide for the same level of data protection. We ensure that the recipient of your Personal Data offers an adequate level of protection and security, for instance by entering into the appropriate back-to-back agreements and, if required, standard contractual clauses or an alternative mechanism for the transfer of data as approved by the European Commission (Art. 46 GDPR) or other applicable regulators or legislators. Where required by applicable law, we will only share, transfer or store your Personal Data outside of your jurisdiction with your prior consent.
## 8. Children
Our websites and services are not directed at children. We do not knowingly collect Personal Data from children under the age of 13. We do not knowingly collect Personal Data for children between 13-18 unless we have obtained consent from a parent or guardian or such collection is subject to a separate agreement with us or the visit by a child is unsolicited or incidental. If you believe we have mistakenly or unintentionally collected Personal Data of a minor without appropriate consent please contact us by using the information in Section 13 below and we will take steps to delete their Personal Data from our systems.
## 9. How long do we keep your Personal Data?
We may retain your Personal Data for a period of time consistent with the original purpose of collection (see Section 5 above) or as long as required to fulfill our legal obligations. We determine the appropriate retention period for Personal Data on the basis of the amount, nature, and sensitivity of the Personal Data being processed, the potential risk of harm from unauthorized use or disclosure of the Personal Data, whether we can achieve the purposes of the processing through other means, and on the basis of applicable legal requirements (such as applicable statutes of limitation).
After expiry of the applicable retention periods, your Personal Data will be deleted. If there is any data that we are unable, for technical reasons, to delete entirely from our systems, we will implement appropriate measures to prevent any further use of such data.
For more information on data retention periods, please contact us by using the information in the Section 13 below.
## 10. Your rights relating to your Personal Data
### 10.1 Your rights
You may have certain rights relating to your Personal Data, subject to local data protection laws. Depending on the applicable laws these rights may include the right to:
 * Access your Personal Data held by us;
 * Know more about how we process your Personal Data;
 * Rectify inaccurate Personal Data and, taking into account the purpose of processing the Personal Data, ensure it is complete;
 * Erase or delete your Personal Data;
 * Restrict our processing of your Personal Data;
 * Transfer your Personal Data to another controller, to the extent possible;
 * Object to any processing of your Personal Data;
 * Opt out of certain disclosures of your Personal Data to third parties;
 * Know what categories of Personal Data are shared for delivering advertisements on non-Ainzel websites, applications, and services and the categories of recipients of such Personal Data;
 * Opt out of the sharing of your Personal Data for delivering advertisements on non-Ainzel websites, applications, and services;
 * If you’re under the age of 16, or such other applicable age of consent for privacy purposes in relevant individual jurisdictions, opt in to certain disclosures of your Personal Data to third parties; 
 * Not be subject to a decision based solely on automated processing, including profiling, which produces legal effects ("Automated Decision-Making");
 * Withdraw your consent at any time (to the extent we base processing on consent), without affecting the lawfulness of the processing based on such consent before its withdrawal; and
 * Not be discriminated against for exercising your rights as described above.
 Where we process your Personal Data for direct marketing purposes or share it with third parties for their own direct marketing purposes, you can exercise your right to object at any time to such processing without having to provide any specific reason for such objection.
Please note that Automated Decision-Making currently does not take place on our websites or in our services.
### 10.2 How to exercise your rights
To exercise your rights, please contact us by using the information in Section 13 below. Your Personal Data may be processed in responding to these rights. We try to respond to all legitimate requests within one month unless otherwise required by law, and will contact you if we need additional information from you in order to honor your request or verify your identity. Occasionally it may take us longer than a month, taking into account the complexity and number of requests we receive. If you are an employee of a Ainzel customer, we recommend you contact your employer’s system administrator for assistance in correcting or updating your information.
Some registered users may update their user settings, profiles, organization settings and event registrations by logging into their accounts and editing their settings or profiles.
To update your billing information, discontinue your account or request return or deletion of your Personal Data and other information associated with your account, please contact us by using the information in Section 13 below.
10.3 Your rights relating to customer data
As described above, we may also process Personal Data submitted by or for a customer to our products and services. To this end, if not stated otherwise in this Privacy Statement or in a separate disclosure, we process such Personal Data as a processor on behalf of our customer (and its affiliates) who is the controller of the Personal Data (see Section 1 above). We are not responsible for and have no control over the privacy and data security practices of our customers, which may differ from those explained in this Privacy Statement. If your data has been submitted to us in our role as a processor by or on behalf of a Ainzel customer and you wish to exercise any rights you may have under applicable data protection laws, please inquire with them directly. Because we may only access a customer’s data upon their instructions, if you wish to make your request directly to us, please provide us the name of the Ainzel customer who submitted your data to us. We will refer your request to that customer, and will support them as needed in responding to your request within a reasonable timeframe.
10.4 Your preferences for email and SMS marketing communications
If we process your Personal Data for the purpose of sending you marketing communications, you may manage your receipt of marketing and non-transactional communications from Ainzel by clicking on the “unsubscribe” link located on the bottom of Ainzel marketing emails, by replying or texting ‘STOP’ if you receive Ainzel SMS communications, or by unsubscribing. Please note that, notwithstanding the above, you will continue to receive marketing and non-transactional communications from Ainzel unless you manage your receipt of such communications by clicking on the “unsubscribe” link located on the bottom of Ainzel’s marketing emails.
You may also turn off push notifications on Ainzel apps on your device, or unsubscribe by contacting us using the information in the “Contacting us” section, below.
Please note that opting out of marketing communications does not opt you out of receiving important business communications related to your current relationship with us, such as communications about your subscriptions or event registrations, service announcements or security information.
10.5 Your preferences for telemarketing communications
If you want your phone number to be added to our internal Do-Not-Call telemarketing register, please contact us by using the information in Section 13 below. Please include your first name, last name, company and the phone number you wish to add to our Do-Not-Call register.
Alternatively, you can always let us know during a telemarketing call that you do not want to be called again for marketing purposes.
## 11. How we secure your Personal Data
We take appropriate precautions including organizational, technical, and physical measures to help safeguard against accidental or unlawful destruction, loss, alteration, and unauthorized disclosure of, or access to, the Personal Data we process or use.
While we follow generally accepted standards to protect Personal Data, no method of storage or transmission is 100% secure. You are solely responsible for protecting your password, limiting access to your devices and signing out of websites after your sessions. If you have any questions about the security of our websites, please contact us by using the information in Section 13 below.
## 12. Changes to this Privacy Statement
We will update this Privacy Statement from time to time to reflect changes in our practices, technologies, legal requirements, and other factors. If we do, we will update the “effective date” at the top. If we make a material update, we may provide you with notice prior to the update taking effect, such as by posting a notice on our website or by contacting you directly, or where required under applicable law and feasible, seek your consent to these changes.
We encourage you to periodically review this Privacy Statement to stay informed about our collection, processing and sharing of your Personal Data.
## 13. Contacting us
Ainzel has appointed a Data Protection Officer. To exercise your rights regarding your Personal Data, or if you have questions regarding this Privacy Statement or our privacy practices please fill out this form, email us at privacy@Ainzel.com or datasubjectrequest@Ainzel.com, call us at +1-484-744-1324, or write to us at:
Ainzel Data Protection Officer (Ainzel Privacy Team)
167 Old State Road
Berwyn, PA 19312, USA 
When you contact us, please indicate in which country and/or state you reside.
We are committed to working with you to obtain a fair resolution of any complaint or concern about privacy. If, however, you believe that we have not been able to assist with your complaint or concern, and you are located in the European Economic Area or the United Kingdom, you have the right to lodge a complaint with the competent supervisory authority.  If you work or reside in a country that is a member of the European Union or that is in the EEA, you may find the contact details for your appropriate data protection authority on the following website.
## 14. Adherence to APEC Cross Border Privacy Rules (CBPR) and APEC Privacy Recognition for Processors (PRP) System
If you have an unresolved privacy or data use concern that we have not addressed to your satisfaction, please contact the third party dispute resolution provider at https://trustarc.com/dispute-resolution/
## 15. Additional Disclosures for California Residents
The California Consumer Privacy Act (as amended by the California Privacy Rights Act) requires businesses to disclose whether they sell or share Personal Data. As a business covered by the CCPA, we do not sell Personal Data.  We may share Personal Data (in the form of identifiers and internet activity information) with third party advertisers for purposes of targeting advertisements on non-Ainzel websites, applications and services. In addition, we may allow third parties to collect Personal Data from our sites or services if those third parties are authorized service providers who have agreed to our contractual limitations as to their retention, use, and disclosure of such Personal Data, or if you use Ainzel sites or services to interact with third parties or direct us to disclose your Personal Data to third parties.
California law requires that we detail the categories of Personal Data that we disclose for certain “business purposes,” such as to service providers that assist us with securing our services or marketing our products, and to such other entities as described in Sections 5 and 6 of this Privacy Statement. We disclose the following categories of Personal Data for our business purposes:
 
 * Identifiers;
 * Commercial information;
 * Internet activity information;
 * Financial information;  
 * Professional and employment-related information; 
 * Education information;
 * Geolocation data;
 * Audio and visual data;
 * In limited circumstances where allowed by law, information that may be protected characteristics under California or United States law; and
 * Inferences drawn from any of the above information categories. 
 
California law grants state residents certain rights, including the rights to know and access specific types of Personal Data, to learn how we process Personal Data, to request deletion of Personal Data, to request correction of Personal Data, to opt-out of sharing your Personal Data for third party advertising purposes, and not to be denied goods or services for exercising these rights.
If you are a California resident under the age of 18 and have registered for an account with us, you may ask us to remove content or information that you have posted to our website(s). Please note that your request does not ensure complete or comprehensive removal of the content or information, because, for example, some of your content may have been reposted by another user. 
For information on how to exercise your rights, please refer to Section 10.2 of this Privacy Statement. If you are an authorized agent wishing to exercise rights on behalf of a California resident, please contact us using the information in the “Contacting Us” section above and provide us with a copy of the consumer’s written authorization designating you as their agent.
If you would like to opt-out of shares using your cookie identifiers, turn on a Global Privacy Control in your web browser or browser extension. Please see the California Privacy Protection Agency’s website at https://oag.ca.gov/privacy/ccpa for more information on valid Global Privacy Controls.  If you would like to opt-out of shares using other identifiers (like email address), please refer to Section 10.2 of this Privacy Statement.
We may need to verify your identity and place of residence before completing your rights request. 
California Privacy Rights Reporting

| | Requests Submitted                   | Requests Fulfilled in Whole Or In Part      | Average Days to Respond     | Average Days to Complete a Request     |
|-|---------------------------|-----------|----------|----------|
| Requests for access to Personal Data | 0 | - | - | - | 
| Requests to delete Personal Data | 0 | - | - | - | 
| Objections to processing Personal Data | 0 | - | - |  - |
| Requests to correct Personal Data | 0 | - | - |  - |


Data is for all requests received by Ainzel from California residents between January 01, 2024 and March 31, 2024.

''',
                              selectable: false,
                              onTapLink: (_, url, __) => launchURL(url!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

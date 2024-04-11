import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'terms_of_service_model.dart';
export 'terms_of_service_model.dart';

class TermsOfServiceWidget extends StatefulWidget {
  const TermsOfServiceWidget({super.key});

  @override
  State<TermsOfServiceWidget> createState() => _TermsOfServiceWidgetState();
}

class _TermsOfServiceWidgetState extends State<TermsOfServiceWidget> {
  late TermsOfServiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfServiceModel());

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
                  Text(
                    FFLocalizations.of(context).getText(
                      '95m9pz6y' /* Terms Of Service */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF1D4479),
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('TERMS_OF_SERVICE_Icon_8ekb2xiy_ON_TAP');
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
                                  '''Welcome to Ainzel. We’re glad you’re here, and we hope you enjoy everything we have to offer. Please read these Terms carefully because they are a binding agreement between You and Ainzel, Inc. (“Ainzel” or “We”).
These Terms govern your use of the websites that link to these Terms. In these Terms, the word “Sites” refers to each of these websites and the services offered on those Sites. You automatically agree to these Terms and to our Privacy Statement simply by using or logging into the Sites.
Please note that we offer many services. Your use of Ainzel products or services are provided by Ainzel pursuant to a separate manually or digitally-executed agreement. Those additional terms become part of your agreement with us, if you use the services or log into the Sites.

## A. Your Accounts
You may be required to create an account and specify a password in order to use certain services or features on the Sites. To create an account, you must be at least 18 years old and you must provide truthful and accurate information about yourself. Don’t try to impersonate anyone else when you create your account. If your information changes at any time, please update your account to reflect those changes.
In some cases, an account may be assigned to you by an administrator, such as your employer or educational institution. If you are using or logging into an account assigned to you by an administrator, additional terms may apply to your use of the Sites. Moreover, your administrator may be able to access or disable your account without our involvement.
You may not share your account with anyone else. Please keep your password confidential and try not to use it on other websites. If you believe that your account has been compromised at any time, please notify your system administrator.

## B. Modifications and Termination
We reserve the right to modify our Sites at any time, with or without notice to you. For example, we may add or remove functionality or features, and we may suspend or stop a particular feature altogether. We also reserve the right to charge a fee for any of our features at any time. If you don’t like any changes, you can stop using our Sites at any time.

## C. Content You Post
We may provide opportunities for you to post text, photographs, videos, or other content (collectively, “Content”) on the Sites. You can only post Content if you own all the rights to that Content, or if another rights holder has given you permission.
You do not transfer ownership of your Content simply by posting it. However, by posting Content, you grant us, our agents, licensees, and assigns an irrevocable, perpetual (non-exclusive) right and permission to reproduce, encode, store, copy, transmit, publish, post, broadcast, display, publicly perform, adapt, modify, create derivative works of, exhibit, and otherwise use your Content.
Without those rights, we couldn’t offer our Services. Please note that this license continues even if you stop using our Sites.
You agree to indemnify, release, and hold us harmless from any all liability, claims, actions, loss, harm, damage, injury, cost or expense arising out of any Content you post.
Keep in mind that if you send us any information, ideas, suggestions, or other communications to us, those communications will not be confidential. Moreover, unless we tell you otherwise, we reserve the right to reproduce, use, disclose, and distribute such communications without any obligation to you.

## D. Content Posted by Others
We are not responsible for, and do not endorse, Content posted by any other person. Accordingly, we may not be held liable, directly or indirectly, for any loss or damage caused to you in connection with any Content posted by another member.

## E. Your Use of the Sites
Please do not use the Sites in a way that violates any laws, infringes on anyone’s rights, is offensive, or interferes with the Sites or any features on the Sites (including any technological measures we employ to enforce these Terms). It should be common sense, so we won’t bore you with a list of things you shouldn’t do. But if we (in our sole discretion) determine that you have acted inappropriately, we reserve the right to take down Content, terminate your account, prohibit you from using the Sites, and take appropriate legal actions. Using our Site does not give you ownership of any intellectual property rights to the content you access. You may not use content from our Sites unless you obtain permission from us or its owner, or unless you are otherwise permitted by law.
When you use a Site or send communications to us through a Site, you are communicating with us electronically. You consent to receive electronically any communications related to your use of a Site. We may communicate with you by email or by posting notices on the Site. You agree that all agreements, notices, disclosures and other communications that are provided to you electronically satisfy any legal requirement that such communications be in writing. All notices from us intended for receipt by you shall be deemed delivered and effective when sent to the email address you provide to us. Please note that by submitting Content, creating a user account or otherwise providing us with your email address, postal address or phone number, you are agreeing that we or our agents may contact you at that address or number in a manner consistent with our Privacy Statement.

## F. Intellectual Property
If you believe any Content on the Services infringes your copyrights, you may request that we remove the Content from the Services (or disable access to that Content) by following the instructions on this page.

## G. Social Networks
The Service may include features that operate in conjunction with certain third party social networking websites that you visit such as Facebook, Instagram, YouTube, Vimeo, and Twitter (“Social Network Features”). While your use of the Social Network Features is governed by these Terms, your access and use of third party social networking sites and the services provided through the Services is governed by the terms of service and other agreements posted on these sites. You are responsible for ensuring that your use of those sites complies with any applicable terms of service or other agreements.

## H. Our Warranties and Disclaimers
We provide our Services using a commercially reasonable level of care and promise to do our best to make sure you enjoy the Services. But there are certain things that we don’t promise about our Services.
OTHER THAN AS EXPRESSLY SET OUT IN THESE TERMS OF SERVICE, NEITHER AINZEL, INC. NOR ITS AGENTS OR SERVICE PROVIDERS (THE “SERVICES ENTITIES”) MAKE ANY SPECIFIC PROMISES ABOUT THE SITES. FOR EXAMPLE, WE DON’T MAKE ANY COMMITMENTS ABOUT THE CONTENT WITHIN THE SITES, THE SPECIFIC FUNCTION OF THE SITES, OR THEIR RELIABILITY, AVAILABILITY, OR ABILITY TO MEET YOUR NEEDS. WE PROVIDE THE SITES “AS IS”.
SOME JURISDICTIONS PROVIDE FOR CERTAIN WARRANTIES, LIKE THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. TO THE EXTENT PERMITTED BY LAW, WE EXCLUDE ALL WARRANTIES.

## I. Liability for our Services
EXCEPT WHERE PROHIBITED, THE SERVICES ENTITIES SHALL NOT BE LIABLE FOR ANY INDIRECT, SPECIAL, INCIDENTAL, CONSEQUENTIAL, OR EXEMPLARY DAMAGES ARISING FROM YOUR USE OF THE SITES OR ANY THIRD PARTY’S USE OF THE SITES. THESE EXCLUSIONS INCLUDE, WITHOUT LIMITATION, DAMAGES FOR LOST PROFITS, LOST DATA, COMPUTER FAILURE, OR THE VIOLATION OF YOUR RIGHTS BY ANY THIRD PARTY, EVEN IF THE SERVICES ENTITIES HAVE BEEN ADVISED OF THE POSSIBILITY THEREOF AND REGARDLESS OF THE LEGAL OR EQUITABLE THEORY UPON WHICH THE CLAIM IS BASED.

## J. Additional Details
We may modify these Terms at any time so be sure to check back regularly. By continuing to use or log in to a Site after these Terms have changed, you indicate your agreement to the revised Terms. If you do not agree to the changes, you should stop using or logging in to the Sites.
The Sites may contain links to third-party websites. That doesn’t mean that we control or endorse those websites, or any goods or services sold on those websites. Similarly, the Sites may contain ads from third-parties. We do not control or endorse any products being advertised.
If you do not comply with these Terms, and we don’t take action right away, this doesn’t mean we’re OK with what you did, or we are giving up any rights that we may have (such as taking action in the future).
These Terms are governed by and construed in accordance with the laws of Delaware, without regard to its conflict of laws rules. You expressly agree that the exclusive jurisdiction for any claim or dispute under these Terms and or your use of the Services resides in the courts located in Wilmington, Delaware, and you further expressly agree to submit to the personal jurisdiction of such courts for the purpose of litigating any such claim or action. If it turns out that a particular provision in these Terms is not enforceable, that will not affect any other provision.
Ainzel accepts and responds to any requests such as disclosure, correction, addition, or deletion and veto of use or provision of personal information (the “Disclosure Requests”) from the person who provided his/her personal information. 
Contact for inquiries regarding Personal Information Handling: personalinfo@ainzel.com

These terms were last updated on April 2, 2024.''',
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

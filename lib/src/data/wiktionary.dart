import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:csslib/visitor.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/opensource/darkreader.dart';
import 'package:salita/utils/functions.dart';
import '/settings_keys.dart';
import '/utils/extensions.dart';

import 'namespace.dart';
import 'wiktionary_languages.dart';

abstract class SourceWiktionary {
  final String url;
  final String name;
  final int numberEntries;
  final String languageBreakpoint;
  final List<Namespace> namespaces;

  const SourceWiktionary({
    required this.url,
    required this.name,
    this.numberEntries = 0,
    this.languageBreakpoint = 'h2',
    required this.namespaces,
  });

  factory SourceWiktionary.fromCode(String code) => map[code]!;
  //TODO put this method as an extension method when this becomes a package
  factory SourceWiktionary.fromSettings() =>
      SourceWiktionary.fromCode(SettingsKeys.settingsDefinitionLanguage);

  /// The complete map of all wiktionary languages
  static const map = <String, SourceWiktionary>{
    // ACTIVE
    'ang': SourceWiktionaryAng.instance,
    'af': SourceWiktionaryAf.instance,
    'an': SourceWiktionaryAn.instance,
    'roa-rup': SourceWiktionaryRoaRup.instance,
    'ast': SourceWiktionaryAst.instance,
    'gn': SourceWiktionaryGn.instance,
    'ay': SourceWiktionaryAy.instance,
    'az': SourceWiktionaryAz.instance,
    'id': SourceWiktionaryId.instance,
    'ms': SourceWiktionaryMs.instance,
    'zh-min-nan': SourceWiktionaryZhMinNan.instance,
    'jv': SourceWiktionaryJv.instance,
    'su': SourceWiktionarySu.instance,
    'bcl': SourceWiktionaryBcl.instance,
    'bs': SourceWiktionaryBs.instance,
    'br': SourceWiktionaryBr.instance,
    'ca': SourceWiktionaryCa.instance,
    'cs': SourceWiktionaryCs.instance,
    'co': SourceWiktionaryCo.instance,
    'cy': SourceWiktionaryCy.instance,
    'da': SourceWiktionaryDa.instance,
    'de': SourceWiktionaryDe.instance,
    'na': SourceWiktionaryNa.instance,
    'et': SourceWiktionaryEt.instance,
    'en': SourceWiktionaryEn.instance,
    'es': SourceWiktionaryEs.instance,
    'eo': SourceWiktionaryEo.instance,
    'eu': SourceWiktionaryEu.instance,
    'fo': SourceWiktionaryFo.instance,
    'fr': SourceWiktionaryFr.instance,
    'fy': SourceWiktionaryFy.instance,
    'ga': SourceWiktionaryGa.instance,
    'gv': SourceWiktionaryGv.instance,
    'sm': SourceWiktionarySm.instance,
    'gd': SourceWiktionaryGd.instance,
    'gl': SourceWiktionaryGl.instance,
    'ha': SourceWiktionaryHa.instance,
    'hr': SourceWiktionaryHr.instance,
    'io': SourceWiktionaryIo.instance,
    'ia': SourceWiktionaryIa.instance,
    'ie': SourceWiktionaryIe.instance,
    'ik': SourceWiktionaryIk.instance,
    'zu': SourceWiktionaryZu.instance,
    'is': SourceWiktionaryIs.instance,
    'it': SourceWiktionaryIt.instance,
    'kl': SourceWiktionaryKl.instance,
    'csb': SourceWiktionaryCsb.instance,
    'kw': SourceWiktionaryKw.instance,
    'rw': SourceWiktionaryRw.instance,
    'sw': SourceWiktionarySw.instance,
    'ku': SourceWiktionaryKu.instance,
    'la': SourceWiktionaryLa.instance,
    'lv': SourceWiktionaryLv.instance,
    'lb': SourceWiktionaryLb.instance,
    'lt': SourceWiktionaryLt.instance,
    'li': SourceWiktionaryLi.instance,
    'ln': SourceWiktionaryLn.instance,
    'jbo': SourceWiktionaryJbo.instance,
    'hu': SourceWiktionaryHu.instance,
    'mg': SourceWiktionaryMg.instance,
    'mt': SourceWiktionaryMt.instance,
    'mi': SourceWiktionaryMi.instance,
    'fj': SourceWiktionaryFj.instance,
    'nah': SourceWiktionaryNah.instance,
    'nl': SourceWiktionaryNl.instance,
    'no': SourceWiktionaryNo.instance,
    'nn': SourceWiktionaryNn.instance,
    'oc': SourceWiktionaryOc.instance,
    'om': SourceWiktionaryOm.instance,
    'uz': SourceWiktionaryUz.instance,
    'nds': SourceWiktionaryNds.instance,
    'pl': SourceWiktionaryPl.instance,
    'pt': SourceWiktionaryPt.instance,
    'ro': SourceWiktionaryRo.instance,
    'qu': SourceWiktionaryQu.instance,
    'sg': SourceWiktionarySg.instance,
    'st': SourceWiktionarySt.instance,
    'tn': SourceWiktionaryTn.instance,
    'sq': SourceWiktionarySq.instance,
    'scn': SourceWiktionaryScn.instance,
    'simple': SourceWiktionarySimple.instance,
    'ss': SourceWiktionarySs.instance,
    'tl': SourceWiktionaryTl.instance,
    'vi': SourceWiktionaryVi.instance,
    'tpi': SourceWiktionaryTpi.instance,
    'tr': SourceWiktionaryTr.instance,
    'tk': SourceWiktionaryTk.instance,
    'vo': SourceWiktionaryVo.instance,
    'wa': SourceWiktionaryWa.instance,
    'wo': SourceWiktionaryWo.instance,
    'ts': SourceWiktionaryTs.instance,
    'el': SourceWiktionaryEl.instance,
    'be': SourceWiktionaryBe.instance,
    'bg': SourceWiktionaryBg.instance,
    'ky': SourceWiktionaryKy.instance,
    'kk': SourceWiktionaryKk.instance,
    'mk': SourceWiktionaryMk.instance,
    'mn': SourceWiktionaryMn.instance,
    'ru': SourceWiktionaryRu.instance,
    'sr': SourceWiktionarySr.instance,
    'tt': SourceWiktionaryTt.instance,
    'tg': SourceWiktionaryTg.instance,
    'uk': SourceWiktionaryUk.instance,
    'hy': SourceWiktionaryHy.instance,
    'ka': SourceWiktionaryKa.instance,
    'gom': SourceWiktionaryGom.instance,
    'ks': SourceWiktionaryKs.instance,
    'ne': SourceWiktionaryNe.instance,
    'mr': SourceWiktionaryMr.instance,
    'sa': SourceWiktionarySa.instance,
    'hi': SourceWiktionaryHi.instance,
    'hif': SourceWiktionaryHif.instance,
    'hsb': SourceWiktionaryHsb.instance,
    'bn': SourceWiktionaryBn.instance,
    'pa': SourceWiktionaryPa.instance,
    'gu': SourceWiktionaryGu.instance,
    'or': SourceWiktionaryOr.instance,
    'ta': SourceWiktionaryTa.instance,
    'te': SourceWiktionaryTe.instance,
    'kn': SourceWiktionaryKn.instance,
    'min': SourceWiktionaryMin.instance,
    'ml': SourceWiktionaryMl.instance,
    'si': SourceWiktionarySi.instance,
    'th': SourceWiktionaryTh.instance,
    'my': SourceWiktionaryMy.instance,
    'lo': SourceWiktionaryLo.instance,
    'km': SourceWiktionaryKm.instance,
    'iu': SourceWiktionaryIu.instance,
    'chr': SourceWiktionaryChr.instance,
    'ti': SourceWiktionaryTi.instance,
    'am': SourceWiktionaryAm.instance,
    'ko': SourceWiktionaryKo.instance,
    'ja': SourceWiktionaryJa.instance,
    'zh': SourceWiktionaryZh.instance,
    'yue': SourceWiktionaryYue.instance,
    'yi': SourceWiktionaryYi.instance,
    'he': SourceWiktionaryHe.instance,
    'ur': SourceWiktionaryUr.instance,
    'ar': SourceWiktionaryAr.instance,
    'ps': SourceWiktionaryPs.instance,
    'pnb': SourceWiktionaryPnb.instance,
    'sd': SourceWiktionarySd.instance,
    'shn': SourceWiktionaryShn.instance,
    'shy': SourceWiktionaryShy.instance,
    'vec': SourceWiktionaryVec.instance,
    'fa': SourceWiktionaryFa.instance,
    'ug': SourceWiktionaryUg.instance,
    'dv': SourceWiktionaryDv.instance,

    //USES WIKIPEDIA
    //'als': SourceWiktionaryAls.instance,
  };

  @mustCallSuper
  Element parseHtmlString(BuildContext context, String html) {
    // PROMOTE HEADING COUNT BY 2 (<h3> -> <h1>)
    html = html.replaceAllMapped(
      RegExp(r'\<h([3-7])\>(.*?)\<\/h\1\>'),
      (match) {
        return '<h${int.parse(match.group(1)!) - 2}>${match.group(2)!}</h${int.parse(match.group(1)!) - 2}>';
      },
    );

    // PARSE THE HTML
    // .children[0] = <html>
    // .children[1] = <body>
    final source = parse(html).children[0].children[1];

    // DARK THEME BACKGROUND COLOR CHANGER
    if (Theme.of(context).brightness == Brightness.dark) {
      source.querySelectorAll("[style*=background]").forEach((element) {
        final a = (element.styles
            .firstWhere((e) => e.property.contains('background'))
            .value!);
        late final Color color;
        if (a is HexColorTerm) {
          final _ = (element.styles
                  .firstWhere((e) => e.property.contains('background'))
                  .value! as HexColorTerm);
              
          if (_.value is int) color = Color(_.value);
          // Skip the element if it has BAD_HEX_VALUE
          if (_.value is BAD_HEX_VALUE) return;
        } else if (a is FunctionTerm) {
          color = fromCssColor("rgb(" + a.span!.text);
        } else {
          return;
        }
        element.attributes['style'] =
            "${element.attributes['style']!.replaceAll(RegExp(r'background(\-color)?:.*;?'), "background:${modifyLightModeHSL(
                  color: color,
                  poleBgColor: Theme.of(context).backgroundColor,
                ).toCssString()};")};background:${modifyLightModeHSL(
          color: color,
          poleBgColor: Theme.of(context).backgroundColor,
        ).toCssString()};";
      });
    }

    return source;
  }

  @mustCallSuper
  Widget? parseHtmlWidgetSimple({
    required BuildContext context,
    required Element element,
    required Function(BuildContext context,
            {required String title,
            required List<Widget> children,
            required bool isOnline})
        bottomsheet,
    required bool isOnline,
    required Widget Function({
      Key? key,
      required String data,
      bool isNested,
      required bool isOnline,
    })
        htmlwidget,
    required dynamic strings,
  }) {
    // Quotation handler, turns quotations into the button
    if (element.parent?.localName == 'li' &&
        element.localName == 'ul' &&
        // checks that all children of the element are:
        element.children.every((element) =>
            element.children.tryFirst?.className == 'citation-whole' ||
            element.children.tryFirst?.localName == 'b' ||
            // to compensate for quotations inside <dd> tags
            element.children.tryFirst?.children.tryFirst?.children.tryFirst
                    ?.className ==
                'citation-whole' ||
            // to compensate for quotations with maintenance lines
            element.children.tryFirst?.className == 'maintenance-line')) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            bottomsheet(
              context,
              title: strings.Definition.html.quotations.title,
              children: [
                htmlwidget(
                  isNested: true,
                  isOnline: isOnline,
                  data: element.outerHtml.trim(),
                ),
              ],
              isOnline: isOnline,
            );
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.format_quote_outlined),
              ),
              Text(strings.Definition.html.quotations.button),
            ],
          ),
        ),
      );
    }

    // Translations handler
    if (element.localName == 'table' &&
        element.classes.contains('translations')) {
      // add wrap so that the button's height & width is wrap content
      return Wrap(
        children: [
          OutlinedButton(
            onPressed: () {
              bottomsheet(
                context,
                title: strings.Definition.html.translations.title,
                children: [
                  htmlwidget(
                    isNested: true,
                    isOnline: isOnline,
                    data: element.innerHtml.trim(),
                  ),
                ],
                isOnline: isOnline,
              );
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.translate_outlined),
                ),
                Text(strings.Definition.html.translations.button),
              ],
            ),
          )
        ],
      );
    }

    // Derived terms handler
    if (element.localName == 'div' &&
        element.classes.contains('derivedterms') &&
        element.parent?.localName == 'div' &&
        element.parent?.classes.contains('list-switcher') == true) {
      // add wrap so that the button's height & width is wrap content
      return Wrap(
        children: [
          OutlinedButton(
            onPressed: () {
              bottomsheet(
                context,
                title: strings.Definition.html.termlist.title,
                children: [
                  htmlwidget(
                    isNested: true,
                    isOnline: isOnline,
                    data: element.innerHtml.trim(),
                  ),
                ],
                isOnline: isOnline,
              );
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.list_alt_outlined),
                ),
                Text(strings.Definition.html.termlist.button),
              ],
            ),
          )
        ],
      );
    }

    // Other navframes handler
    if (element.localName == 'div' &&
        element.classes.contains('NavFrame') &&
        element.querySelector('.NavHead') != null &&
        element.querySelector('.NavContent') != null &&
        element.querySelector('.translations') == null) {
      return OutlinedButton(
        onPressed: () {
          bottomsheet(
            context,
            title: element.querySelector('.NavHead')!.text.trim(),
            children: [
              htmlwidget(
                isNested: true,
                isOnline: isOnline,
                data: () {
                  final e = element.clone(true);
                  e.querySelectorAll('.NavToggle, .NavHead').forEach((element) {
                    element.remove();
                  });
                  return e.innerHtml.trim();
                }(),
              ),
            ],
            isOnline: isOnline,
          );
        },
        child: Text(element.querySelector('.NavHead')!.text.trim()),
      );
    }

    //If unhandled, return null
    return null;
  }

  @mustCallSuper
  BuildMetadata parseHtmlWidgetAdvanced({
    required BuildContext context,
    required BuildMetadata meta,
    required Function(BuildContext context,
            {required String title,
            required List<Widget> children,
            required bool isOnline})
        bottomsheet,
    required bool isOnline,
    required Widget Function(
            {Key? key,
            required String data,
            bool isNested,
            required bool isOnline})
        htmlwidget,
    required dynamic strings,
  }) {
    final element = meta.element;

    // abbreviation handler, turns <abbr> to the blue boxes
    if (element.localName == 'abbr') {
      meta.register(BuildOp(
        onTree: (meta, tree) {
          //remove the rendered default
          tree.last?.detach();
          // add the custom renderer
          tree.add(WidgetBit.inline(
            tree,
            Tooltip(
              message: element.attributes['title'] ??
                  strings.General.snackbar.noDescription,
              child: InkResponse(
                //if the display is desktop, then make it not clickable
                onTap: isPlatformDesktop()
                    ? null
                    : () {
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Text(
                                    element.text,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      element.attributes['title'] ??
                                          strings
                                              .General.snackbar.noDescription,
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                      },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Text(
                    element.text,
                  ),
                ),
              ),
            ),
            alignment: PlaceholderAlignment.middle,
          ));
        },
      ));
    }

    return meta;
  }
}
import 'package:flutter/material.dart' hide Element;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/strings.g.dart';

abstract class Namespace {
  final String id;
  final int namespaceId;
  final String namespaceName;
  final List<String> namespaceAlias;
  final IconData icon;
  
  const Namespace({
    required this.id,
    required this.namespaceId,
    required this.namespaceName,
    this.icon = MdiIcons.text,
    this.namespaceAlias = const [],
  });

  String get nameLocalized => namespaceName.replaceAll(":", '');

  String removePrefix(String old){
    if (old.toLowerCase().startsWith(namespaceName.toLowerCase())){
      return old.replaceAll(RegExp(RegExp.escape(namespaceName)), '');
    } else {
      return old;
    }
  }
}

class NamespaceDictionary extends Namespace {
  const NamespaceDictionary({
    super.namespaceId = 0,
    super.namespaceName = ':',
    super.icon = Icons.book_outlined,
    super.namespaceAlias,
  }):super(id: 'dictionary');
  
  @override
  String get nameLocalized => strings.Definition.namespace.dictionary.name;
}

class NamespaceThesaurus extends Namespace {
  const NamespaceThesaurus({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.bookEducationOutline,
    super.namespaceAlias,
  }):super(id: 'thesaurus');
  
  @override
  String get nameLocalized => strings.Definition.namespace.thesaurus.name;
}
class NamespaceRhymes extends Namespace {
  const NamespaceRhymes({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.try_sms_star_outlined,
    super.namespaceAlias,
  }):super(id: 'rhymes');
  
  @override
  String get nameLocalized => strings.Definition.namespace.rhymes.name;
}
class NamespaceReconstruction extends Namespace {
  const NamespaceReconstruction({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.textRecognition,
    super.namespaceAlias,
  }):super(id: 'reconstruction');
  
  @override
  String get nameLocalized => strings.Definition.namespace.reconstruction.name;
}
class NamespaceConcordance extends Namespace {
  const NamespaceConcordance({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.auto_stories_outlined,
    super.namespaceAlias,
  }):super(id: 'concordance');
  
  @override
  String get nameLocalized => strings.Definition.namespace.concordance.name;
}
class NamespaceCitations extends Namespace {
  const NamespaceCitations({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.commentQuoteOutline,
    super.namespaceAlias,
  }):super(id: 'citations');
  
  @override
  String get nameLocalized => strings.Definition.namespace.citations.name;
}
class NamespaceSigngloss extends Namespace {
  const NamespaceSigngloss({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.sign_language_outlined,
    super.namespaceAlias,
  }):super(id: 'signgloss');
  
  @override
  String get nameLocalized => strings.Definition.namespace.signgloss.name;
}
class NamespaceAppendix extends Namespace {
  const NamespaceAppendix({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.quiz_outlined,
    super.namespaceAlias,
  }):super(id: 'appendix');
  
  @override
  String get nameLocalized =>strings.Definition.namespace.appendix.name;
}

class NamespaceIndex extends Namespace {
  const NamespaceIndex({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.bookOpenVariant,
    super.namespaceAlias,
  }):super(id: 'index');
  
  @override
  String get nameLocalized => strings.Definition.namespace.index.name;
}
class NamespaceInflection extends Namespace {
  const NamespaceInflection({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.transitConnectionHorizontal,
    super.namespaceAlias,
  }):super(id: 'inflection');
  
  @override
  String get nameLocalized => strings.Definition.namespace.inflection.name;
}
class NamespaceRoot extends Namespace {
  const NamespaceRoot({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.relationOneToOneOrMany,
    super.namespaceAlias,
  }):super(id: 'root');
  
  @override
  String get nameLocalized => strings.Definition.namespace.root.name;
}
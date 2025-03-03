import '../tags_model.dart';

abstract class TagsStates {}

class TagsInitialState extends TagsStates {}

class TagsLoadingState extends TagsStates {}

class TagsLoadedState extends TagsStates {
  final List<Tag> tags;
  TagsLoadedState(this.tags);
}

class TagsErrorState extends TagsStates {
  final String errormsg;
  TagsErrorState(this.errormsg);
}

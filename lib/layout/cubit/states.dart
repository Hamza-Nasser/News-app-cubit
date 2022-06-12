abstract class NewsStates{}


class NewsInitialState extends NewsStates{}
class ChangeBottomNavBarState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetDataBusinessSuccessState extends NewsStates{}
class NewsGetDataBusinessFailedState extends NewsStates{
  final String error;
  NewsGetDataBusinessFailedState(this.error);
}


class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetDataSportsSuccessState extends NewsStates{}
class NewsGetDataSportsFailedState extends NewsStates{
  final String error;
  NewsGetDataSportsFailedState(this.error);
}


class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetDataScienceSuccessState extends NewsStates{}
class NewsGetDataScienceFailedState extends NewsStates{
  final String error;
  NewsGetDataScienceFailedState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetDataSearchSuccessState extends NewsStates{}
class NewsGetDataSearchFailedState extends NewsStates{
  final String error;
  NewsGetDataSearchFailedState(this.error);
}
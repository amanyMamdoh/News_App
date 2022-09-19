abstract class NewsAppState{}

class intialState extends NewsAppState{}

class changeNavBar extends NewsAppState{}

class NewsLoadingState extends NewsAppState{}

 class getBusinessNewsState extends NewsAppState{}

class getBusinessNewsErrorState extends NewsAppState{
  late final String error;
  getBusinessNewsErrorState(this.error);
}
class SportsNewsLoadingState extends NewsAppState{}

class getSportsNewsState extends NewsAppState{}

class getSportsNewsErrorState extends NewsAppState{
  late final String error;
  getSportsNewsErrorState(this.error);
}
class ScienceNewsLoadingState extends NewsAppState{}

class getScienceNewsState extends NewsAppState{}

class getScienceNewsErrorState extends NewsAppState{
  late final String error;
  getScienceNewsErrorState(this.error);
}
class ChangeModeState extends NewsAppState{}

class SearchNewsLoadingState extends NewsAppState{}

class getSearchNewsState extends NewsAppState{}

class getSearchNewsErrorState extends NewsAppState{
  late final String error;
  getSearchNewsErrorState(this.error);
}


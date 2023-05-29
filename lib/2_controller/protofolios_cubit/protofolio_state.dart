part of 'protofolio_cubit.dart';

@immutable
abstract class PortfolioState {}


//add portfolio
class AddPortfolioInitial extends PortfolioState {}
class AddPortfolioLoadingState extends PortfolioState {}
class AddPortfolioSuccessState extends PortfolioState {}
class AddPortfolioFailedInitial extends PortfolioState {}

//get portfolio
class GetPortfolioLoadingState extends PortfolioState {}
class GetPortfolioSuccessState extends PortfolioState {}
class GetPortfolioFailedInitial extends PortfolioState {}

//Delete portfolio
class DeletePortfolioLoadingState extends PortfolioState {}
class DeletePortfolioSuccessState extends PortfolioState {}
class DeletePortfolioFailedInitial extends PortfolioState {}
# CarApp Read Me

The app uses an MVVM-C Rx Architecture.
The reason why this architecture was selected is that MVVM separates business logic from view logic.
The coordinator part makes navigation between modules easy by allowing a few lines of code to show a new view. The coordinator also acts as the only entry point for the next module and if a module is deleted then one can simply remove the code in the navigation into the existing modules and the app still compiles.
In this architecture are also use cases which is where the business logic lives. This allows for easy testing and there is no need to create a ViewModel that requires a coordinator to use a navigation controller. 
I used a protocol for the network interactors so that I can create test interactors that subscribe to the protocol and inject the test interactors into the use case for testing purposes.
The View in the MVVM architecture sends all user events to the view model. The view model then takes appropriate action which could include calling a use case. The use case could fetch data from the network or a local database and then the view model sends any update to the view model.
Every module needs to have a view, view model, model, interactor and coordinator. Even when these are not necessary for smaller modules it is good to set it up in case the smaller modules need it in the future. The MapModule serves as an example here.

- The design will be improved once collaboration over designs is done.
- Tests need be improved to handle "RxSwift subscribe" better.
- Initialize components in init rather than var.
- Not use the non-nil exclamation mark (!) for components to ensure they are not nil.
- For purposes of demonstrating dealing with nullable objects, one can assume position can be in some cases be null.
- A decision was made to not handle loading indicators and errors in this version due to time constraints. The architecture is set up well to handle this in the future.
- A decision was made to use one localized string file rather than multiple localised strings per module.

 A decision was made to shorten the struct for Localised Comments by abbreviating the module name (SomeModuleLocalisedComments becomes SMLComments)
	- This decreases readability for this line but improves the overall readability for the rest of the code. 
	- An exception to improving readability can be made in this case for shorter code as it improves the overall readability of the code.
	- Using shortening in this manner is not recommended for future cases.
	- Readability should always be the highest priority.

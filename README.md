# SkipNavigation

"Skipping over" view controllers

Method One - in First.storyboard and FirstViewControllers.swift - uses ChildViewController and manually animating the view off the screen.

Method Two - in Second.storyboard and SecondViewControllers.swift - uses a NavigationController that does not show the navigation bar, and calls setViewControllers:animated: to "jump to" the last one in the stack... after which, view controllers can be "popped off" the stack as usual.


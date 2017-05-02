//
//  FirstViewControllers.swift
//  SkipNavigation
//
//  Created by Don Mag on 5/2/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class FirstWhiteVC: UIViewController {
	
	var theDelegate: FirstOrangeDelegate?
	
	@IBAction func revealOrangeTapped(_ sender: Any) {
		
		theDelegate?.removeWhiteVC()
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	
}

protocol FirstOrangeDelegate {
	func removeWhiteVC()
}

class FirstOrangeVC: UIViewController, FirstOrangeDelegate {
	
	var whiteVC: FirstWhiteVC?
	
	@IBAction func backToBlackTapped(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func removeWhiteVC() -> Void {
		UIView.animate(withDuration: 0.3, animations: {
			self.whiteVC?.view.frame.origin.y = self.view.frame.size.height + 1
		}, completion: {_ in
			self.whiteVC?.view.removeFromSuperview()
			self.whiteVC?.removeFromParentViewController()
		})
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		if let wvc = storyboard?.instantiateViewController(withIdentifier: "firstWhiteVC") as? FirstWhiteVC {
			
			wvc.theDelegate = self
			
			self.addChildViewController(wvc)
			
			self.view.addSubview(wvc.view)
			
			wvc.didMove(toParentViewController: self)
			
			whiteVC = wvc
			
		}
		
	}
	
}

class FirstBlackVC: UIViewController {

	@IBAction func showWhiteTapped(_ sender: Any) {
		
		let sBoard = UIStoryboard(name: "First", bundle: nil)
			
		if let ovc = sBoard.instantiateViewController(withIdentifier: "firstOrangeVC") as? FirstOrangeVC {
			
			present(ovc, animated: true, completion: nil)
			
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


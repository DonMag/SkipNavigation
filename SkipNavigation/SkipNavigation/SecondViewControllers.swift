//
//  SecondViewControllers.swift
//  SkipNavigation
//
//  Created by Don Mag on 5/2/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class SecondWhiteVC: UIViewController {
	
	@IBAction func popToOrangeTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
}

class SecondOrangeVC: UIViewController {
	
	@IBAction func popToBlackTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
}

class SecondBlackVC: UIViewController {

	@IBAction func navToWhiteTapped(_ sender: Any) {
		
		let sBoard = UIStoryboard(name: "Second", bundle: nil)
		
		if let ovc = sBoard.instantiateViewController(withIdentifier: "secondOrangeVC") as? SecondOrangeVC,
			let wvc = sBoard.instantiateViewController(withIdentifier: "secondWhiteVC") as? SecondWhiteVC {
			
			let vcs = [self, ovc, wvc]
			
			self.navigationController?.setViewControllers(vcs, animated: true)
			
		}
		
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

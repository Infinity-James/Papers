//
//  PapersInitialViewController.swift
//  Papers
//
//  Created by James Valaitis on 20/07/2015.
//  Copyright (c) 2015 &Beyond. All rights reserved.
//

import UIKit

//	MARK: Papers Initial View Controller
class PapersInitialViewController: UIViewController {

	//	MARK: Properties
	let walkthroughManager = WalkthroughManager(numberOfPages: 1, pagePrefix: "WalkthroughPage", storyboardName: "Walkthrough")
	
	//	MARK: View Lifecycle
	override func viewDidLoad() {
		if !WalkthroughManager.shownWalkthrough {
			self.presentViewController(walkthroughManager.walkthroughViewController, animated: true) {}
		}
	}
}
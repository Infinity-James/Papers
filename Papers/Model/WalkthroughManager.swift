//
//  WalkthroughManager.swift
//  Papers
//
//  Created by James Valaitis on 20/07/2015.
//  Copyright (c) 2015 &Beyond. All rights reserved.
//

import Foundation
import UIKit

//	MARK: Walkthrough Manager Struct
struct WalkthroughManager {
	
	//	MARK: Properties
	static private let walkthroughShownUserDefaultsKey = "ShownWalkthrough"
	let storyboard: UIStoryboard
	let pagePrefix: String
	let numberOfPages: UInt
	
	//	MARK: Computed Properties
	var walkthroughViewController: UIViewController {
		get {
			let walkthrough = storyboard.instantiateInitialViewController() as! BWWalkthroughViewController
			for pageNumber in 1...numberOfPages {
				let pageName = "\(pagePrefix)\(pageNumber)"
				let page = storyboard.instantiateViewControllerWithIdentifier(pageName) as! UIViewController
				walkthrough.addViewController(page)
			}
			
			return walkthrough
		}
	}
	
	static var shownWalkthrough: Bool {
		get {
			let shownWalkthrough = NSUserDefaults.standardUserDefaults().boolForKey(walkthroughShownUserDefaultsKey)
			return shownWalkthrough
		}
	}
	
	//	MARK: Initialisation
	init(numberOfPages: UInt, pagePrefix: String, storyboardName: String, storyboardBundle: NSBundle? = nil) {
		self.numberOfPages = numberOfPages
		self.pagePrefix = pagePrefix
		
		storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
	}
}
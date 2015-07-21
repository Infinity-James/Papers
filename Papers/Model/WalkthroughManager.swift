//
//  WalkthroughManager.swift
//  Papers
//
//  Created by James Valaitis on 20/07/2015.
//  Copyright (c) 2015 &Beyond. All rights reserved.
//

import Foundation
import UIKit

//  MARK: Walkthrough Manager Delegate
protocol WalkthroughManagerDelegate {
	func walkthroughManagerDidCloseWalkthrough(walkthroughManager: WalkthroughManager)
}

//	MARK: Walkthrough Manager Class
class WalkthroughManager {
	
	//	MARK: Properties
	static private let walkthroughShownUserDefaultsKey = "ShownWalkthrough"
	/** The storyboard containing the walkthrough (with the walkthrough view controller as the initial view controller).	*/
	let storyboard: UIStoryboard
	/**	The prefix for each view controller describing a page (with an appended number ordering the pages).	*/
	let pagePrefix: String
	/**	The number of pages for the walkthrough, in the storyboard. */
	let numberOfPages: UInt
	/**	The object interested in updates in the walkthrough through this manager.	*/
	var delegate: WalkthroughManagerDelegate?
	
	//	MARK: Computed Properties
	/**	The view controller containing the walkthrough.	*/
	var walkthroughViewController: UIViewController {
		get {
			let walkthrough = storyboard.instantiateInitialViewController() as! BWWalkthroughViewController
			walkthrough.delegate = self
			for pageNumber in 1...numberOfPages {
				let pageName = "\(pagePrefix)\(pageNumber)"
				let page = storyboard.instantiateViewControllerWithIdentifier(pageName) as! UIViewController
				walkthrough.addViewController(page)
			}
			
			return walkthrough
		}
	}
	
	/**	Whether or not the walkthrough has been shown before.	*/
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

//  MARK: BWWalkthroughViewControllerDelegate Methods
extension WalkthroughManager: BWWalkthroughViewControllerDelegate {
	func walkthroughCloseButtonPressed() {
		self.delegate?.walkthroughManagerDidCloseWalkthrough(self)
	}
	
	func walkthroughPageDidChange(pageNumber: Int) {
		NSUserDefaults.standardUserDefaults().setBool(true, forKey: WalkthroughManager.walkthroughShownUserDefaultsKey)
	}
}
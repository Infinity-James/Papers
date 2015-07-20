//
//  PublicationsCollectionViewController.swift
//  TestApp
//
//  Created by James Valaitis on 20/07/2015.
//  Copyright (c) 2015 &Beyond. All rights reserved.
//

import UIKit

//	MARK: Publications Collection View Controller Class
class PublicationsCollectionViewController : UICollectionViewController {
	
	//	MARK: Properties
	
	let cellIdentifier = "PublicationCell"
	
	//	MARK: UICollectionViewDataSource Methods
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! PublicationCell
		
		return cell
	}
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	//	MARK: UICollectionViewDelegate Methods
	
	
}
//
//  usersClassObjects.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import Foundation
import RealmSwift

class UserDetails:Object{
   @objc dynamic var username : String?
   @objc dynamic var age : String?
   @objc dynamic var phNumber : String?
   @objc dynamic var password : String?
   //@objc dynamic var gender : String?
}


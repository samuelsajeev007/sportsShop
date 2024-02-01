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

class Item: Object {
    
    @Persisted var image: Data?
    @Persisted var quantity: Int = 0
    @Persisted var amount: Double = 0.0
}

class NewItem: Object {
    @Persisted var image: Data?
    @Persisted var quantity: Int = 0
    @Persisted var amount: Double = 0.0
    @Persisted var id: Int = 0
    
}
//
//class BookingDetails: Object {
//    @objc dynamic var userNameOfBooking : String?
//    @objc dynamic var bookingDate : String?
//    @objc dynamic var dayTime : String?
//    @objc dynamic var address : String?
//    @objc dynamic var UserPhNumber : String?
//    @objc dynamic var itemId : String?
//    @objc dynamic var itemCount : Int = 0
//    @objc dynamic var amount: String?
//        
//}

class BookingDetailsUsers: Object {
    @objc dynamic var userNameOfBooking : String?
    @objc dynamic var bookingDate : String?
    @objc dynamic var dayTime : String?
    @objc dynamic var address : String?
    @objc dynamic var UserPhNumber : String?
    @objc dynamic var itemId : String?
    @objc dynamic var itemCount : Int = 0
    @objc dynamic var amount: String?
        
}

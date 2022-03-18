//
//  Customer.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import Foundation

struct CustomerDetail: Codable {
    let fullName: String
    let phoneNumber: String
    let visitorsNotes:String?
    let partySize: Int
    let bookingTime: String
    var reservation: Bool
    let bookTime: Date?
}

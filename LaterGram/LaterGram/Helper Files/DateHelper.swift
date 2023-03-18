//
//  DateHelper.swift
//  LaterGram
//
//  Created by Colton Brenneman on 3/14/23.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

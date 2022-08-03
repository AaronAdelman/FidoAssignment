//
//  DateExtensions.swift
//  FidoAssignment
//
//  Created by אהרן שלמה אדלמן on 03/08/2022.
//

import Foundation

extension Date {
    static func from(_ string: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: string)
        return date
    }
}

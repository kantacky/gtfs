//
//  CalendarDate.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Conditionally Required**
///
/// Primary key (service_id, date)
public struct CalendarDate: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a set of dates when a service exception occurs for one or more routes. Each (`service_id`, `date`) pair may appear at most once in [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt) if using [calendar.txt](https://gtfs.org/documentation/schedule/reference/#calendartxt) and [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt) in conjunction. If a `service_id` value appears in both [calendar.txt](https://gtfs.org/documentation/schedule/reference/#calendartxt) and [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt), the information in [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt) modifies the service information specified in [calendar.txt](https://gtfs.org/documentation/schedule/reference/#calendartxt).
    public let serviceId: String
    
    /// Date when service exception occurs.
    public let date: String
    
    /// Indicates whether service is available on the date specified in the date field. Valid options are:
    /// 1 - Service has been added for the specified date.
    /// 2 - Service has been removed for the specified date.
    public let exceptionType: ExceptionType
    
    public init(
        serviceId: String,
        date: String,
        exceptionType: ExceptionType
    ) {
        self.serviceId = serviceId
        self.date = date
        self.exceptionType = exceptionType
    }
    
    public var id: String { "\(serviceId)_\(date)" }
}



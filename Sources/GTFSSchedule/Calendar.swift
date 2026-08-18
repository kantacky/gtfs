//
//  Calendar.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Conditionally Required**
///
/// Primary key (service_id)
public struct Calendar: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a set of dates when service is available for one or more routes. Each `service_id` value may appear at most once in a [calendar.txt](https://gtfs.org/documentation/schedule/reference/#calendartxt) file.
    public let serviceId: String

    /// Indicates whether the service operates on all Mondays in the date range specified by the `start_date` and `end_date` fields. Note that exceptions for particular dates may be listed in [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt). Valid options are:
    /// 0 - Service is not available on Mondays in the date range.
    /// 1 - Service is available on Mondays in the date range.
    public let monday: Bool

    /// Functions in the same way as `monday` except applies to Tuesdays.
    public let tuesday: Bool

    /// Functions in the same way as `monday` except applies to Wednesdays.
    public let wednesday: Bool

    /// Functions in the same way as `monday` except applies to Thursdays.
    public let thursday: Bool

    /// Functions in the same way as `monday` except applies to Fridays.
    public let friday: Bool

    /// Functions in the same way as `monday` except applies to Saturdays.
    public let saturday: Bool

    /// Functions in the same way as `monday` except applies to Sundays.
    public let sunday: Bool

    /// Start service day for the service interval.
    public let startDate: String

    /// End service day for the service interval. This service day is included in the interval.
    public let endDate: String

    public init(
        serviceId: String,
        monday: Bool,
        tuesday: Bool,
        wednesday: Bool,
        thursday: Bool,
        friday: Bool,
        saturday: Bool,
        sunday: Bool,
        startDate: String,
        endDate: String
    ) {
        self.serviceId = serviceId
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
        self.startDate = startDate
        self.endDate = endDate
    }

    public var id: String { serviceId }
}

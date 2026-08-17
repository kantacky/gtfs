//
//  BookingRule.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (booking_rule_id)
public struct BookingRule: Codable, Identifiable, Hashable, Sendable {
    /// Identifies the booking rule.
    public let bookingRuleId: String
    
    /// Indicates how far in advance booking can be made. Valid options are:
    /// 0 - Real time booking.
    /// 1 - Up to same-day booking.
    /// 2 - Up to one day in advance booking.
    /// 3 - Up to two days in advance booking.
    /// ...
    /// 14 - Up to thirteen days in advance booking.
    public let bookingType: BookingType
    
    /// Indicates the latest time before the service that booking can be made. Valid options are:
    /// 0 - Booking can be made up to the departure time.
    /// 1 - Booking must be made at least 1 minute before departure.
    /// 2 - Booking must be made at least 2 minutes before departure.
    /// ...
    /// 1440 - Booking must be made at least 1440 minutes (24 hours) before departure.
    public let priorNoticeDurationMin: Int?
    
    /// Indicates the latest time on the last day that booking can be made. Valid options are:
    /// 0 - Booking can be made until the end of the service day.
    /// 1 - Booking can be made until 23:59 on the last day.
    /// 2 - Booking can be made until 23:58 on the last day.
    /// ...
    /// 1439 - Booking can be made until 00:01 on the last day.
    public let priorNoticeLastDay: Int?
    
    /// Indicates the start of the time period every day when booking can be made. Valid options are:
    /// 0 - Booking can be made starting from 00:00 every day.
    /// 1 - Booking can be made starting from 00:01 every day.
    /// ...
    /// 1439 - Booking can be made starting from 23:59 every day.
    public let priorNoticeStartDay: Int?
    
    /// Indicates the end of the time period every day when booking can be made. Valid options are:
    /// 0 - Booking can be made until 00:00 every day.
    /// 1 - Booking can be made until 00:01 every day.
    /// ...
    /// 1439 - Booking can be made until 23:59 every day.
    public let priorNoticeServiceTime: Int?
    
    /// Function in the same way as the `prior_notice_duration_min` except the notice period is defined in number of service days instead of minutes. The booking cut-off is calculated using `prior_notice_service_time` if it's provided, otherwise it will default to the end of the service day.
    public let priorNoticeDurationDays: Int?
    
    /// Indicates which days of the week `prior_notice_duration_days` applies to. Each day of the week is represented by a bit position: Sunday (0x01), Monday (0x02), Tuesday (0x04), Wednesday (0x08), Thursday (0x10), Friday (0x20), Saturday (0x40). Multiple days can be specified by adding the bits. For example `prior_notice_service_time=127` means that `prior_notice_duration_days` applies every day of the week, while `prior_notice_service_time=96` means that `prior_notice_duration_days` applies only on Saturday and Sunday.
    public let priorNoticeServiceTime2: Int?
    
    /// Contains a message intended for customers indicating the booking process for the service. This should contain a full description of the booking process, including information about whom to call, what websites to visit, when booking opens, when booking must be completed by, restrictions on booking, and other useful information.
    public let message: String?
    
    /// Contains the URL providing information about the booking process for the service. This should be a customer-facing website or page, and should not be a deep link to a mobile application. If provided, the URL should be accessible from a web browser (rather than only from a mobile app), and should provide information about the booking process for the service.
    public let pickupMessage: String?
    
    /// Contains a message intended for customers indicating the drop off process for the service. This should contain a full description of the drop off process, including information about whom to call, what websites to visit, when drop off booking opens, when drop off booking must be completed by, restrictions on drop off, and other useful information.
    public let dropOffMessage: String?
    
    /// Contains the URL providing information about the booking process for the service when alighting. This should be a customer-facing website or page, and should not be a deep link to a mobile application.
    public let phoneNumber: String?
    
    /// Contains the URL providing information about the booking process for the service. This should be a customer-facing website or page, and should not be a deep link to a mobile application.
    public let infoUrl: String?
    
    /// Contains the URL that can be used by a customer to make a booking for the service. This should be a customer-facing website or page, and should not be a deep link to a mobile application.
    public let bookingUrl: String?
    
    public init(
        bookingRuleId: String,
        bookingType: BookingType,
        priorNoticeDurationMin: Int?,
        priorNoticeLastDay: Int?,
        priorNoticeStartDay: Int?,
        priorNoticeServiceTime: Int?,
        priorNoticeDurationDays: Int?,
        priorNoticeServiceTime2: Int?,
        message: String?,
        pickupMessage: String?,
        dropOffMessage: String?,
        phoneNumber: String?,
        infoUrl: String?,
        bookingUrl: String?
    ) {
        self.bookingRuleId = bookingRuleId
        self.bookingType = bookingType
        self.priorNoticeDurationMin = priorNoticeDurationMin
        self.priorNoticeLastDay = priorNoticeLastDay
        self.priorNoticeStartDay = priorNoticeStartDay
        self.priorNoticeServiceTime = priorNoticeServiceTime
        self.priorNoticeDurationDays = priorNoticeDurationDays
        self.priorNoticeServiceTime2 = priorNoticeServiceTime2
        self.message = message
        self.pickupMessage = pickupMessage
        self.dropOffMessage = dropOffMessage
        self.phoneNumber = phoneNumber
        self.infoUrl = infoUrl
        self.bookingUrl = bookingUrl
    }
    
    public var id: String { bookingRuleId }
}



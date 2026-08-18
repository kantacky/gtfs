//
//  BookingType.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

public enum BookingType: Int, Codable, CaseIterable, Identifiable, Sendable {
    /// 0 - Real time booking.
    case realTime = 0

    /// 1 - Up to same-day booking.
    case sameDay = 1

    /// 2 - Up to one day in advance booking.
    case oneDay = 2

    /// 3 - Up to two days in advance booking.
    case twoDays = 3

    /// 4 - Up to three days in advance booking.
    case threeDays = 4

    /// 5 - Up to four days in advance booking.
    case fourDays = 5

    /// 6 - Up to five days in advance booking.
    case fiveDays = 6

    /// 7 - Up to six days in advance booking.
    case sixDays = 7

    /// 8 - Up to seven days in advance booking.
    case sevenDays = 8

    /// 9 - Up to eight days in advance booking.
    case eightDays = 9

    /// 10 - Up to nine days in advance booking.
    case nineDays = 10

    /// 11 - Up to ten days in advance booking.
    case tenDays = 11

    /// 12 - Up to eleven days in advance booking.
    case elevenDays = 12

    /// 13 - Up to twelve days in advance booking.
    case twelveDays = 13

    /// 14 - Up to thirteen days in advance booking.
    case thirteenDays = 14

    public var id: Int { rawValue }
}

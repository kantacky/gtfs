//
//  FeedInfo.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (*)
public struct FeedInfo: Codable, Identifiable, Hashable, Sendable {
    /// Full name of the organization that publishes the dataset. This might be the same as one of the `agency.agency_name` values.
    public let feedPublisherName: String
    
    /// URL of the organization that publishes the dataset. This might be the same as one of the `agency.agency_url` values.
    public let feedPublisherUrl: String
    
    /// Default language for the text in this dataset. This setting helps GTFS consumers choose capitalization rules and other language-specific settings for the dataset.
    public let feedLang: String
    
    /// Defines the language that should be used when the data consumer doesn't know the language of the rider. It will often be `en` (English).
    public let defaultLang: String?
    
    /// The dataset provides complete and reliable schedule information for service in the period from the beginning of the `feed_start_date` day to the end of the `feed_end_date` day. Both days may be left empty if unavailable. The `feed_end_date` date must not precede the `feed_start_date` date if both are given. It is recommended that dataset providers give schedule data outside this period to advise of likely future service, but dataset consumers should treat it mindful of its non-authoritative status. If `feed_start_date` or `feed_end_date` extend beyond the active calendar dates defined in [calendar.txt](https://gtfs.org/documentation/schedule/reference/#calendartxt) and [calendar_dates.txt](https://gtfs.org/documentation/schedule/reference/#calendar_datestxt), the dataset is making an explicit assertion that there is no service for dates within the `feed_start_date` or `feed_end_date` range but not included in the active calendar dates.
    public let feedStartDate: String?
    
    /// (see above)
    public let feedEndDate: String?
    
    /// String that indicates the current version of their GTFS dataset. GTFS-consuming applications can display this value to help dataset publishers determine whether the latest dataset has been incorporated.
    public let feedVersion: String?
    
    /// Email address for communication regarding the GTFS dataset and data publishing practices. `feed_contact_email` is a technical contact for GTFS-consuming applications. Provide customer service contact information through [agency.txt](https://gtfs.org/documentation/schedule/reference/#agencytxt). It's recommended that at least one of `feed_contact_email` or `feed_contact_url` are provided.
    public let feedContactEmail: String?
    
    /// URL for contact information, a web-form, support desk, or other tools for communication regarding the GTFS dataset and data publishing practices. `feed_contact_url` is a technical contact for GTFS-consuming applications. Provide customer service contact information through [agency.txt](https://gtfs.org/documentation/schedule/reference/#agencytxt). It's recommended that at least one of `feed_contact_url` or `feed_contact_email` are provided.
    public let feedContactUrl: String?
    
    public init(
        feedPublisherName: String,
        feedPublisherUrl: String,
        feedLang: String,
        defaultLang: String?,
        feedStartDate: String?,
        feedEndDate: String?,
        feedVersion: String?,
        feedContactEmail: String?,
        feedContactUrl: String?
    ) {
        self.feedPublisherName = feedPublisherName
        self.feedPublisherUrl = feedPublisherUrl
        self.feedLang = feedLang
        self.defaultLang = defaultLang
        self.feedStartDate = feedStartDate
        self.feedEndDate = feedEndDate
        self.feedVersion = feedVersion
        self.feedContactEmail = feedContactEmail
        self.feedContactUrl = feedContactUrl
    }
    
    public var id: String { feedPublisherName }
}

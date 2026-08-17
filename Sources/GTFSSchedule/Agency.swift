//
//  Agency.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

/// File: **Required**
///
/// Primary key (agency_id)
public struct Agency: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a transit brand which is often synonymous with a transit agency. Note that in some cases, such as when a single agency operates multiple separate services, agencies and brands are distinct. This document uses the term "agency" in place of "brand". A dataset may contain data from multiple agencies.
    ///
    /// Conditionally Required:
    /// - **Required** when the dataset contains data for multiple transit agencies.
    /// - Recommended otherwise.
    public let agencyId: String

    /// Full name of the transit agency.
    public let agencyName: String

    /// URL of the transit agency.
    public let agencyUrl: String

    /// Timezone where the transit agency is located. If multiple agencies are specified in the dataset, each must have the same `agency_timezone`.
    public let agencyTimezone: String

    /// Primary language used by this transit agency. Should be provided to help GTFS consumers choose capitalization rules and other language-specific settings for the dataset.
    public let agencyLang: String?

    /// A voice telephone number for the specified agency. This field is a string value that presents the telephone number as typical for the agency's service area. It may contain punctuation marks to group the digits of the number. Dialable text (for example, TriMet's "503-238-RIDE") is permitted, but the field must not contain any other descriptive text.
    public let agencyPhone: String?

    /// URL of a web page where a rider can purchase tickets or other fare instruments for that agency, or a web page containing information about that agency's fares.
    public let agencyFareUrl: String?

    /// Email address actively monitored by the agency’s customer service department. This email address should be a direct contact point where transit riders can reach a customer service representative at the agency.
    public let agencyEmail: String?

    public init(
        agencyId: String,
        agencyName: String,
        agencyUrl: String,
        agencyTimezone: String,
        agencyLang: String?,
        agencyPhone: String?,
        agencyFareUrl: String?,
        agencyEmail: String?
    ) {
        self.agencyId = agencyId
        self.agencyName = agencyName
        self.agencyUrl = agencyUrl
        self.agencyTimezone = agencyTimezone
        self.agencyLang = agencyLang
        self.agencyPhone = agencyPhone
        self.agencyFareUrl = agencyFareUrl
        self.agencyEmail = agencyEmail
    }

    public var id: String { agencyId }
}

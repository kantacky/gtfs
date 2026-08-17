//
//  Attribution.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (attribution_id)
public struct Attribution: Codable, Identifiable, Hashable, Sendable {
    /// Identifies an attribution for the dataset or a subset of it. This is mostly useful for translations.
    public let attributionId: String?
    
    /// Agency to which the attribution applies. If one `agency_id`, `route_id`, or `trip_id` attribution is defined, the other ones must be empty. If none of them is specified, the attribution will apply to the whole dataset.
    public let agencyId: String?
    
    /// Functions in the same way as `agency_id` except the attribution applies to a route. Multiple attributions may apply to the same route.
    public let routeId: String?
    
    /// Functions in the same way as `agency_id` except the attribution applies to a trip. Multiple attributions may apply to the same trip.
    public let tripId: String?
    
    /// Name of the organization that the dataset is attributed to.
    public let organizationName: String
    
    /// The role of the organization is producer. Valid options are:
    /// 0 or empty - Organization doesn't have this role.
    /// 1 - Organization does have this role.
    /// At least one of the fields `is_producer`, `is_operator`, or `is_authority` should be set at 1.
    public let isProducer: Bool?
    
    /// Functions in the same way as `is_producer` except the role of the organization is operator.
    public let isOperator: Bool?
    
    /// Functions in the same way as `is_producer` except the role of the organization is authority.
    public let isAuthority: Bool?
    
    /// URL of the organization.
    public let attributionUrl: String?
    
    /// Email of the organization.
    public let attributionEmail: String?
    
    /// Phone number of the organization.
    public let attributionPhone: String?
    
    public init(
        attributionId: String?,
        agencyId: String?,
        routeId: String?,
        tripId: String?,
        organizationName: String,
        isProducer: Bool?,
        isOperator: Bool?,
        isAuthority: Bool?,
        attributionUrl: String?,
        attributionEmail: String?,
        attributionPhone: String?
    ) {
        self.attributionId = attributionId
        self.agencyId = agencyId
        self.routeId = routeId
        self.tripId = tripId
        self.organizationName = organizationName
        self.isProducer = isProducer
        self.isOperator = isOperator
        self.isAuthority = isAuthority
        self.attributionUrl = attributionUrl
        self.attributionEmail = attributionEmail
        self.attributionPhone = attributionPhone
    }
    
    public var id: String { attributionId ?? organizationName }
}

//
//  RiderCategory.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (rider_category_id)
public struct RiderCategory: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a rider category.
    public let riderCategoryId: String

    /// Name of the rider category.
    public let riderCategoryName: String?

    /// Minimum age for the rider category. If there are multiple rider categories with the same `min_age`, the one with the smaller `rider_category_id` takes precedence.
    public let minAge: Int?

    /// Maximum age for the rider category. If there are multiple rider categories with the same `max_age`, the one with the smaller `rider_category_id` takes precedence.
    public let maxAge: Int?

    /// URL linking to documentation that describes the rider category.
    public let riderCategoryUrl: String?

    /// Defines the eligibility of a rider category.
    public let eligibilityUrl: String?

    public init(
        riderCategoryId: String,
        riderCategoryName: String?,
        minAge: Int?,
        maxAge: Int?,
        riderCategoryUrl: String?,
        eligibilityUrl: String?
    ) {
        self.riderCategoryId = riderCategoryId
        self.riderCategoryName = riderCategoryName
        self.minAge = minAge
        self.maxAge = maxAge
        self.riderCategoryUrl = riderCategoryUrl
        self.eligibilityUrl = eligibilityUrl
    }

    public var id: String { riderCategoryId }
}

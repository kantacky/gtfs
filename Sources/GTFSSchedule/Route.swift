//
//  Route.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Required**
///
/// Primary key (route_id)
public struct Route: Codable, Identifiable, Hashable, Sendable {
    /// Identifies a route.
    public let routeId: String
    
    /// Agency for the specified route.
    ///
    /// Conditionally Required:
    /// - **Required** if multiple agencies are defined in agency.txt.
    /// - Optional otherwise.
    public let agencyId: String?
    
    /// Short name of a route. Often a short, abstract identifier (such as "32", "100X", "Green") that riders use to identify a route. Both `route_short_name` and `route_long_name` may be defined.
    public let routeShortName: String?
    
    /// Full name of a route. This name is generally more descriptive than the `route_short_name` and often includes the route's destination or stop. Both `route_short_name` and `route_long_name` may be defined.
    public let routeLongName: String?
    
    /// Description of a route that provides useful, quality information. Should not be a duplicate of `route_short_name` or `route_long_name`.
    public let routeDesc: String?
    
    /// Type of transportation used on a route.
    public let routeType: RouteType
    
    /// URL of a web page about the particular route. Should be different from the `agency.agency_url` value.
    public let routeUrl: String?
    
    /// Route color designation that matches public facing material. Defaults to white (FFFFFF) when omitted or left empty. The color difference between `route_color` and `route_text_color` should provide sufficient contrast when viewed on a black and white screen.
    public let routeColor: String?
    
    /// Legible color to use for text drawn against a background of `route_color`. Defaults to black (000000) when omitted or left empty. The color difference between `route_color` and `route_text_color` should provide sufficient contrast when viewed on a black and white screen.
    public let routeTextColor: String?
    
    /// Orders the routes in a way which is ideal for presentation to customers. Routes with smaller `route_sort_order` values should be displayed first.
    public let routeSortOrder: Int?
    
    /// Indicates that the rider can board the transit vehicle anywhere along the vehicle's travel path as described by shapes.txt, on every trip of the route. Valid options are:
    /// 0 - Continuous stopping behavior.
    /// 1 - No continuous stopping behavior.
    /// 2 - Must phone agency to arrange continuous stopping behavior.
    /// 3 - Must coordinate with driver to arrange continuous stopping behavior.
    ///
    /// The default continuous pickup behavior defined in `routes.txt` may be overridden in `stop_times.txt`.
    public let continuousPickup: PickupDropOffType?
    
    /// Indicates that the rider can alight from the transit vehicle at any point along the vehicle's travel path as described by shapes.txt, on every trip of the route. Valid options are:
    /// 0 - Continuous stopping behavior.
    /// 1 - No continuous stopping behavior.
    /// 2 - Must phone agency to arrange continuous stopping behavior.
    /// 3 - Must coordinate with driver to arrange continuous stopping behavior.
    ///
    /// The default continuous drop off behavior defined in `routes.txt` may be overridden in `stop_times.txt`.
    public let continuousDropOff: PickupDropOffType?
    
    /// Identifies a network to which the route belongs. The `network_id` must match an ID defined in the optional networks.txt file.
    public let networkId: String?
    
    public init(
        routeId: String,
        agencyId: String?,
        routeShortName: String?,
        routeLongName: String?,
        routeDesc: String?,
        routeType: RouteType,
        routeUrl: String?,
        routeColor: String?,
        routeTextColor: String?,
        routeSortOrder: Int?,
        continuousPickup: PickupDropOffType?,
        continuousDropOff: PickupDropOffType?,
        networkId: String?
    ) {
        self.routeId = routeId
        self.agencyId = agencyId
        self.routeShortName = routeShortName
        self.routeLongName = routeLongName
        self.routeDesc = routeDesc
        self.routeType = routeType
        self.routeUrl = routeUrl
        self.routeColor = routeColor
        self.routeTextColor = routeTextColor
        self.routeSortOrder = routeSortOrder
        self.continuousPickup = continuousPickup
        self.continuousDropOff = continuousDropOff
        self.networkId = networkId
    }
    
    public var id: String { routeId }
}

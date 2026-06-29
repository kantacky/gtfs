import Foundation

enum ProfileVersion: String {
    case v1, v2, v3, v4, unknown

    var label: String {
        switch self {
        case .v1: return "第1版"
        case .v2: return "第2版"
        case .v3: return "第3版"
        case .v4: return "第4版"
        case .unknown: return "不明（純正GTFSの可能性）"
        }
    }
}

enum GTFSJPDetector {
    // v3の公式差分（commmmons_doc_007-03_ver01.pdf）で「v4で本仕様に追加」とされたファイル群。
    // いずれか1つでもZIP内に存在すれば v4 と判定する。
    static let v4Files: Set<String> = [
        // Pathways
        "pathways.txt", "levels.txt",
        // Flex
        "location_groups.txt", "location_group_stops.txt",
        "locations.geojson", "booking_rules.txt",
        // Fares V2
        "timeframes.txt", "rider_categories.txt", "fare_media.txt",
        "fare_products.txt", "fare_leg_rules.txt", "fare_leg_join_rules.txt",
        "fare_transfer_rules.txt", "areas.txt", "stop_areas.txt",
        "networks.txt", "route_networks.txt",
    ]

    // v4で新設されたカラム（v3には存在しない）。ファイル名 -> 該当列名集合。
    // 1つでもヒットすれば v4 とみなす。
    static let v4Columns: [String: Set<String>] = [
        "feed_info.txt": ["default_lang", "feed_contact_email", "feed_contact_url"],
        "agency.txt": ["cemv_support"],
        "stops.txt": ["tts_stop_name", "level_id", "stop_access"],
        "routes.txt": [
            "route_sort_order", "continuous_pickup", "continuous_drop_off",
            "network_id", "cemv_support",
        ],
        "trips.txt": ["cars_allowed"],
        "stop_times.txt": [
            "location_group_id", "location_id",
            "continuous_pickup", "continuous_drop_off",
            "start_pickup_drop_off_window", "end_pickup_drop_off_window",
            "pickup_booking_rule_id", "drop_off_booking_rule_id",
        ],
    ]

    // v3のシグナル: pattern_jp.txt の存在 か trips.jp_pattern_id の存在。
    static let v3Files: Set<String> = ["pattern_jp.txt"]
    static let v3Columns: [String: Set<String>] = [
        "trips.txt": ["jp_pattern_id"]
    ]

    // v1/v2 共通の jp 拡張ファイル（v2の決定的差分は実装時に第2版仕様を参照して確定）。
    static let jpExtensionFiles: Set<String> = ["agency_jp.txt", "office_jp.txt"]

    static func detect(_ inspection: FeedInspection) -> (ProfileVersion, [String]) {
        var reasons: [String] = []

        // v4判定
        let v4FileHits = inspection.files.intersection(v4Files)
        if !v4FileHits.isEmpty {
            reasons.append("v4拡張ファイルを検出: \(v4FileHits.sorted().joined(separator: ", "))")
            return (.v4, reasons)
        }
        for (file, cols) in v4Columns {
            if let header = inspection.headers[file] {
                let hits = header.intersection(cols)
                if !hits.isEmpty {
                    reasons.append("\(file) に v4 拡張列を検出: \(hits.sorted().joined(separator: ", "))")
                    return (.v4, reasons)
                }
            }
        }

        // v3判定
        let v3FileHits = inspection.files.intersection(v3Files)
        if !v3FileHits.isEmpty {
            reasons.append("v3シグナルファイル: \(v3FileHits.sorted().joined(separator: ", "))")
            return (.v3, reasons)
        }
        for (file, cols) in v3Columns {
            if let header = inspection.headers[file] {
                let hits = header.intersection(cols)
                if !hits.isEmpty {
                    reasons.append("\(file) に v3 シグナル列: \(hits.sorted().joined(separator: ", "))")
                    return (.v3, reasons)
                }
            }
        }

        // v2判定 (jp拡張ファイルのいずれかが存在)
        let jpHits = inspection.files.intersection(jpExtensionFiles)
        if !jpHits.isEmpty {
            reasons.append("jp拡張ファイル: \(jpHits.sorted().joined(separator: ", "))")
            // v1/v2 の厳密な区別は今後第2版仕様で確定。当面 v2 とみなす（実フィードの大半）。
            return (.v2, reasons)
        }

        // v1判定 (fare_rules.txt の min/max stop sequence 列)
        if let fareRules = inspection.headers["fare_rules.txt"] {
            let v1Cols: Set<String> = ["min_stop_sequence", "max_stop_sequence"]
            let hits = fareRules.intersection(v1Cols)
            if !hits.isEmpty {
                reasons.append("fare_rules.txt にv1拡張列: \(hits.sorted().joined(separator: ", "))")
                return (.v1, reasons)
            }
        }

        return (.unknown, reasons)
    }

    /// FeedInspector に渡す「ヘッダ抽出対象」ファイル集合。
    static var interestedFiles: Set<String> {
        var s: Set<String> = [
            "feed_info.txt", "agency.txt", "stops.txt", "routes.txt",
            "trips.txt", "stop_times.txt", "fare_rules.txt",
        ]
        s.formUnion(v4Files)
        s.formUnion(v3Files)
        s.formUnion(jpExtensionFiles)
        return s
    }
}

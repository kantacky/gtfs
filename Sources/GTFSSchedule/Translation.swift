//
//  Translation.swift
//  Transit
//
//  Created by Kanta Oikawa on 2025/08/05.
//

import Foundation

/// File: **Optional**
///
/// Primary key (table_name, field_name, language, record_id, record_sub_id, field_value)
public struct Translation: Codable, Identifiable, Hashable, Sendable {
    /// Defines the table that contains the field to be translated.
    public let tableName: String
    
    /// Name of the field to be translated. Fields with type "Text" can be translated, fields with type "URL", "Email" and "Phone number" can also be "translated" to provide resources in the correct language. Fields with other types should not be translated.
    public let fieldName: String
    
    /// Language of translation.
    public let language: String
    
    /// Translation for the specified `table_name.field_name` for the record with the same (primary) key as the record has in the table defined in `table_name`.
    public let translation: String
    
    /// Defines the record that corresponds to the field to be translated. The value in `record_id` should be the first key of the record defined in `table_name` (as defined in the Primary key column of the table).
    public let recordId: String?
    
    /// Helps the record that contains the field to be translated when the table doesn't have a unique record_id. Therefore, `record_sub_id` is the secondary key of the table, as defined in the Primary key column of the table.
    public let recordSubId: String?
    
    /// Instead of using `record_id` and `record_sub_id` to define which record should be translated, this field can be used to define the value for translation. When used, the translation will be applied when the fields identified by `table_name.field_name` contains the exact same value defined in `field_value`.
    public let fieldValue: String?
    
    public init(
        tableName: String,
        fieldName: String,
        language: String,
        translation: String,
        recordId: String?,
        recordSubId: String?,
        fieldValue: String?
    ) {
        self.tableName = tableName
        self.fieldName = fieldName
        self.language = language
        self.translation = translation
        self.recordId = recordId
        self.recordSubId = recordSubId
        self.fieldValue = fieldValue
    }
    
    public var id: String {
        [tableName, fieldName, language, recordId, recordSubId, fieldValue]
            .compactMap { $0 }
            .joined(separator: "_")
    }
}

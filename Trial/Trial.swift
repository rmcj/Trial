// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temperatures = try? newJSONDecoder().decode(Temperatures.self, from: jsonData)

import Foundation

// MARK: - Temperatures
struct Temperatures: Codable {
    let queryType: String
    let mutationType, subscriptionType: JSONNull?
    let directives: [Directive]
    let astNode: JSONNull?
    let typeMap: TypeMap
    let implementations: Implementations

    enum CodingKeys: String, CodingKey {
        case queryType = "_queryType"
        case mutationType = "_mutationType"
        case subscriptionType = "_subscriptionType"
        case directives = "_directives"
        case astNode
        case typeMap = "_typeMap"
        case implementations = "_implementations"
    }
}

// MARK: - Directive
struct Directive: Codable {
    let name, directiveDescription: String
    let locations: [String]
    let args: [Arg]

    enum CodingKeys: String, CodingKey {
        case name
        case directiveDescription = "description"
        case locations, args
    }
}

// MARK: - Arg
struct Arg: Codable {
    let name, argDescription, type: String
    let defaultValue: String?

    enum CodingKeys: String, CodingKey {
        case name
        case argDescription = "description"
        case type, defaultValue
    }
}

// MARK: - Implementations
struct Implementations: Codable {
}

// MARK: - TypeMap
struct TypeMap: Codable {
    let query, continentFilterInput, stringQueryOperatorInput, string: String
    let continent, id, country, language: String
    let boolean, state, countryFilterInput, languageFilterInput: String
    let schema, type, typeKind, field: String
    let inputValue, enumValue, directive, directiveLocation: String
    let cacheControlScope, upload, int: String

    enum CodingKeys: String, CodingKey {
        case query = "Query"
        case continentFilterInput = "ContinentFilterInput"
        case stringQueryOperatorInput = "StringQueryOperatorInput"
        case string = "String"
        case continent = "Continent"
        case id = "ID"
        case country = "Country"
        case language = "Language"
        case boolean = "Boolean"
        case state = "State"
        case countryFilterInput = "CountryFilterInput"
        case languageFilterInput = "LanguageFilterInput"
        case schema = "__Schema"
        case type = "__Type"
        case typeKind = "__TypeKind"
        case field = "__Field"
        case inputValue = "__InputValue"
        case enumValue = "__EnumValue"
        case directive = "__Directive"
        case directiveLocation = "__DirectiveLocation"
        case cacheControlScope = "CacheControlScope"
        case upload = "Upload"
        case int = "Int"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

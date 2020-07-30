// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CountryFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - code
  ///   - currency
  ///   - continent
  public init(code: Swift.Optional<StringQueryOperatorInput?> = nil, currency: Swift.Optional<StringQueryOperatorInput?> = nil, continent: Swift.Optional<StringQueryOperatorInput?> = nil) {
    graphQLMap = ["code": code, "currency": currency, "continent": continent]
  }

  public var code: Swift.Optional<StringQueryOperatorInput?> {
    get {
      return graphQLMap["code"] as? Swift.Optional<StringQueryOperatorInput?> ?? Swift.Optional<StringQueryOperatorInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "code")
    }
  }

  public var currency: Swift.Optional<StringQueryOperatorInput?> {
    get {
      return graphQLMap["currency"] as? Swift.Optional<StringQueryOperatorInput?> ?? Swift.Optional<StringQueryOperatorInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var continent: Swift.Optional<StringQueryOperatorInput?> {
    get {
      return graphQLMap["continent"] as? Swift.Optional<StringQueryOperatorInput?> ?? Swift.Optional<StringQueryOperatorInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "continent")
    }
  }
}

public struct StringQueryOperatorInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - eq
  ///   - ne
  ///   - in
  ///   - nin
  ///   - regex
  ///   - glob
  public init(eq: Swift.Optional<String?> = nil, ne: Swift.Optional<String?> = nil, `in`: Swift.Optional<[String?]?> = nil, nin: Swift.Optional<[String?]?> = nil, regex: Swift.Optional<String?> = nil, glob: Swift.Optional<String?> = nil) {
    graphQLMap = ["eq": eq, "ne": ne, "in": `in`, "nin": nin, "regex": regex, "glob": glob]
  }

  public var eq: Swift.Optional<String?> {
    get {
      return graphQLMap["eq"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var ne: Swift.Optional<String?> {
    get {
      return graphQLMap["ne"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var `in`: Swift.Optional<[String?]?> {
    get {
      return graphQLMap["in"] as? Swift.Optional<[String?]?> ?? Swift.Optional<[String?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "in")
    }
  }

  public var nin: Swift.Optional<[String?]?> {
    get {
      return graphQLMap["nin"] as? Swift.Optional<[String?]?> ?? Swift.Optional<[String?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nin")
    }
  }

  public var regex: Swift.Optional<String?> {
    get {
      return graphQLMap["regex"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "regex")
    }
  }

  public var glob: Swift.Optional<String?> {
    get {
      return graphQLMap["glob"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "glob")
    }
  }
}

public final class CountriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Countries($id: CountryFilterInput) {
      countries(filter: $id) {
        __typename
        name
        native
        capital
        emoji
        currency
        languages {
          __typename
          code
          name
        }
      }
    }
    """

  public let operationName: String = "Countries"

  public var id: CountryFilterInput?

  public init(id: CountryFilterInput? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("countries", arguments: ["filter": GraphQLVariable("id")], type: .nonNull(.list(.nonNull(.object(Country.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countries: [Country]) {
      self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var countries: [Country] {
      get {
        return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("native", type: .nonNull(.scalar(String.self))),
          GraphQLField("capital", type: .scalar(String.self)),
          GraphQLField("emoji", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .scalar(String.self)),
          GraphQLField("languages", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, native: String, capital: String? = nil, emoji: String, currency: String? = nil, languages: [Language]) {
        self.init(unsafeResultMap: ["__typename": "Country", "name": name, "native": native, "capital": capital, "emoji": emoji, "currency": currency, "languages": languages.map { (value: Language) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var native: String {
        get {
          return resultMap["native"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "native")
        }
      }

      public var capital: String? {
        get {
          return resultMap["capital"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "capital")
        }
      }

      public var emoji: String {
        get {
          return resultMap["emoji"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "emoji")
        }
      }

      public var currency: String? {
        get {
          return resultMap["currency"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var languages: [Language] {
        get {
          return (resultMap["languages"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "languages")
        }
      }

      public struct Language: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Language"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Language", "code": code, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: GraphQLID {
          get {
            return resultMap["code"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

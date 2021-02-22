//
//  Brands.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import Foundation
struct Brands : Codable {
	let id : Int?
	let name : String?
	let logo : String?
	let productImage : String?
	let shortTagline : String?
	let isGeneric : Bool?
	let seoName : String?
	let currency : String?
	let detailUrl : String?
	let redemptionTag : String?
	let detailUrlV5 : String?

	enum CodingKeys: String, CodingKey {
		case id, name, logo, currency
		case productImage = "product_image"
		case shortTagline = "short_tagline"
		case isGeneric = "is_generic"
		case seoName = "seo_name"
		case detailUrl = "detail_url"
		case redemptionTag = "redemption_tag"
		case detailUrlV5 = "detail_url_v5"
	}
}

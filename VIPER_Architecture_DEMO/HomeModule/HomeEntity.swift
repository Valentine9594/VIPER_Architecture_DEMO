//
//  HomeEntity.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: Bool?
    let data: NewsDataClass?
}

// MARK: - NewsDataClass
struct NewsDataClass: Codable {
    let categories: [Category]?
    let subCategoryData: SubCategoryData?
    let subCategories: [Category]?
    let stories: [DataStory]?
    let mustSee: MustSee?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case categories
        case subCategoryData = "sub_category_data"
        case subCategories = "sub_categories"
        case stories
        case mustSee = "must_see"
        case meta
    }
}

// MARK: - Category
struct Category: Codable {
    let title, completeSlug, colorCode1, colorCode2: String?
    let selected: Bool?

    enum CodingKeys: String, CodingKey {
        case title
        case completeSlug = "complete_slug"
        case colorCode1 = "color_code_1"
        case colorCode2 = "color_code_2"
        case selected
    }
}

// MARK: - Meta
struct Meta: Codable {
    let totalRecords, totalNoOfPage: Int?
    let lastPage: Bool?
    let currPageNo, limit: Int?

    enum CodingKeys: String, CodingKey {
        case totalRecords = "total_records"
        case totalNoOfPage = "total_no_of_page"
        case lastPage = "last_page"
        case currPageNo = "curr_page_no"
        case limit
    }
}

// MARK: - MustSee
struct MustSee: Codable {
    let label, mustSeeDescription: String?
    let stories: [MustSeeStory]?

    enum CodingKeys: String, CodingKey {
        case label
        case mustSeeDescription = "description"
        case stories
    }
}

// MARK: - MustSeeStory
struct MustSeeStory: Codable {
    let id: Int?
    let type: TypeEnum?
    let title: String?
    let promoLarge: String?
    let shortTitle: String?
    let completeSlug, updatedOn, colorCode: String?

    enum CodingKeys: String, CodingKey {
        case id, type, title
        case promoLarge = "promo_large"
        case shortTitle = "short_title"
        case completeSlug = "complete_slug"
        case updatedOn = "updated_on"
        case colorCode = "color_code"
    }
}

enum TypeEnum: String, Codable {
    case df = "DF"
    case g = "G"
    case lb = "LB"
    case p = "P"
    case v = "V"
}

// MARK: - DataStory
struct DataStory: Codable {
    let id: Int?
    let type: TypeEnum?
    let updatedOn, title: String?
    let shortTitle: String?
    let promoLarge: String?
    let redirectionSlug, completeSlug: String?
    let tags: [String]?
    let imageAltText: String?
    let readingTime: ReadingTime?
    let colorCode, createdOn, storyDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, type
        case updatedOn = "updated_on"
        case title
        case shortTitle = "short_title"
        case promoLarge = "promo_large"
        case redirectionSlug = "redirection_slug"
        case completeSlug = "complete_slug"
        case tags
        case imageAltText = "image_alt_text"
        case readingTime = "reading_time"
        case colorCode = "color_code"
        case createdOn = "created_on"
        case storyDescription = "description"
    }
}

enum ReadingTime: String, Codable {
    case the2Min = "2-MIN"
    case the5Min = "5-MIN"
}

// MARK: - SubCategoryData
struct SubCategoryData: Codable {
    let title, categoryTitle, categorySlug, subCategorySlug: String?
    let completeSlug, metaTitle, metaDescription, metaKeywords: String?
    let colorCode1, colorCode2: String?

    enum CodingKeys: String, CodingKey {
        case title
        case categoryTitle = "category_title"
        case categorySlug = "category_slug"
        case subCategorySlug = "sub_category_slug"
        case completeSlug = "complete_slug"
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeywords = "meta_keywords"
        case colorCode1 = "color_code_1"
        case colorCode2 = "color_code_2"
    }
}


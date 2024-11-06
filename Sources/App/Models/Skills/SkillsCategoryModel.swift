import Foundation
import Vapor
import Fluent

final class SkillsCategoryModel: @unchecked Sendable, Model {
    static let schema: String = SchemaEnum.skills_category.rawValue
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.imageName)
    var imageName: String?
    
    @Children(for: \.$category)
    var groups: [SkillsGroupModel]
    
    init() {}
}

extension SkillsCategoryModel: Content {}

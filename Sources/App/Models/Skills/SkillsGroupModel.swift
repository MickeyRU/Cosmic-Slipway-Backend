import Foundation
import Vapor
import Fluent

final class SkillsGroupModel: @unchecked Sendable, Model {
    static let schema: String = SchemaEnum.skills_group.rawValue
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.imageName)
    var imageName: String
    
    @Parent(key: FieldKeys.categoryId)
    var category: SkillsCategoryModel
    
    @Children(for: \.$group)
    var subGroup: [SkillsSubGroupModel]
    
    init() {}
}

extension SkillsGroupModel: Content {}

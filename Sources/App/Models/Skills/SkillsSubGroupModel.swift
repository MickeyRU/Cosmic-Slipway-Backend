import struct Foundation.UUID
import Vapor
import Fluent

final class SkillsSubGroupModel: @unchecked Sendable, Model {
    static let schema: String = SchemaEnum.skills_sub_group.rawValue
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: FieldKeys.dependency)
    var dependency: SkillTierDependencyEnum.RawValue
    
    @Children(for: \.$subGroup)
    var skills: [SkillModel]
    
    @Parent(key: FieldKeys.groupId)
    var group: SkillsGroupModel
    
    init() {}
    
}

extension SkillsSubGroupModel: Content {}

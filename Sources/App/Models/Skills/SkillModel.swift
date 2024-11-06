import struct Foundation.UUID
import Vapor
import Fluent

final class SkillModel: @unchecked Sendable, Model {
    static let schema: String = SchemaEnum.skill.rawValue
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.imageName)
    var imageName: String
    
    @Field(key: FieldKeys.skillTech)
    var skillTech: SkillTechEnum.RawValue
    
    @Field(key: FieldKeys.experiencePreset)
    var experiencePreset: SkillPresetTierEnum.RawValue
    
    @Field(key: FieldKeys.currentLvl)
    var currentLvl: Int
    
    @Parent(key: FieldKeys.subGroupId)
    var subGroup: SkillsSubGroupModel
    
    init() {}
}

extension SkillModel: Content {}

import Foundation
import Vapor
import Fluent

struct SkillModelMigration: AsyncMigration {
    let schema = SkillModel.schema
    let keys = SkillModel.FieldKeys.self
    
    func prepare(on database: any Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.title, .string, .required)
            .field(keys.imageName, .string, .required)
            .field(keys.skillTech, .string, .required)
            .field(keys.experiencePreset, .string, .required)
            .field(keys.currentLvl, .int, .required)
            .field(keys.subGroupId, .uuid, .required, .references(SkillsSubGroupModel.schema, .id))
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(schema).delete()
    }
}

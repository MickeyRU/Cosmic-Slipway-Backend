import Foundation
import Vapor
import Fluent

struct SkillsSubGroupModelMigration: AsyncMigration {
    let schema = SkillsSubGroupModel.schema
    let keys = SkillsSubGroupModel.FieldKeys.self
    
    func prepare(on database: any Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.dependency, .string, .required)
            .field(keys.groupId, .uuid, .required, .references(SkillsGroupModel.schema, .id))
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(schema).delete()
    }
}

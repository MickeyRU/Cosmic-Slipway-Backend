import Foundation
import Vapor
import Fluent

struct SkillsGroupModelMigration: AsyncMigration {
    let schema = SkillsGroupModel.schema
    let keys = SkillsGroupModel.FieldKeys.self
    
    func prepare(on database: any Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.title, .string, .required)
            .field(keys.imageName, .string, .required)
            .field(keys.categoryId, .uuid, .required, .references(SkillsCategoryModel.schema, .id))
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(schema).delete()
    }
}

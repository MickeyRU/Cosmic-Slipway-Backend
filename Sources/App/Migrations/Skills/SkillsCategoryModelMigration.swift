import Foundation
import Vapor
import Fluent

struct SkillsCategoryModelMigration: AsyncMigration {
    let schema = SkillsCategoryModel.schema
    let keys = SkillsCategoryModel.FieldKeys.self
    
    func prepare(on database: any Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.title, .string, .required)
            .field(keys.imageName, .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(schema).delete()
    }
}

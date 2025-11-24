//
//  CommerceSettings.swift
//  Clerk
//
//  Created by Mike Pitre on 5/9/25.
//

import Foundation

struct CommerceSettings: Codable, Sendable, Equatable {
    let billing: Billing

    struct Billing: Codable, Sendable, Equatable {
        let enabled: Bool
        let hasPaidUserPlans: Bool
        let hasPaidOrgPlans: Bool

        enum CodingKeys: String, CodingKey {
            case enabled
            case hasPaidUserPlans
            case hasPaidOrgPlans
        }

        init(enabled: Bool, hasPaidUserPlans: Bool, hasPaidOrgPlans: Bool) {
            self.enabled = enabled
            self.hasPaidUserPlans = hasPaidUserPlans
            self.hasPaidOrgPlans = hasPaidOrgPlans
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? false
            self.hasPaidUserPlans = try container.decodeIfPresent(Bool.self, forKey: .hasPaidUserPlans) ?? false
            self.hasPaidOrgPlans = try container.decodeIfPresent(Bool.self, forKey: .hasPaidOrgPlans) ?? false
        }
    }
}

extension CommerceSettings {

    static var mock: Self {
        .init(
            billing: .init(
                enabled: true,
                hasPaidUserPlans: true,
                hasPaidOrgPlans: true
            )
        )
    }

}

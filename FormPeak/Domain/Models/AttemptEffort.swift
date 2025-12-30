import Foundation

enum AttemptEffort: String, SegmentedItem {
    case easy, normal, hard, fail
    
    var title: String {
        switch self {
        case .easy: "Легко"
        case .normal: "Нормально"
        case .hard: "Тяжело"
        case .fail: "Фейл"
        }
    }
}

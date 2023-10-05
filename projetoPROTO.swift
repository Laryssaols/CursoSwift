import Foundation

enum TaskStatus {
    case completed
    case incomplete
}

protocol Task {
    var title: String { get }
    var status: TaskStatus { get set }
}

struct TaskItem: Task {
    let title: String
    var status: TaskStatus
}

protocol TaskList {
    var tasks: [Task] { get set }
    func addTask(title: String)
    func listTasks()
    func completeTask(index: Int)
}

class TaskListManager: TaskList {
    var tasks: [Task] = []

    func addTask(title: String) {
        let task = TaskItem(title: title, status: .incomplete)
        tasks.append(task)
    }

    func listTasks() {
        for (index, task) in tasks.enumerated() {
            let statusString = task.status == .incomplete ? "Incompleta" : "Completa"
            print("\(index + 1). \(task.title) (\(statusString))")
        }
    }

    func completeTask(index: Int) {
        if index >= 0 && index < tasks.count {
            tasks[index].status = .completed
        }
    }

    func performConcurrentOperation(operation: @escaping () -> Void) {
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            operation()
        }
    }
}

var taskList = TaskListManager()

taskList.addTask(title: "Fazer o projeto de POO em swift")
taskList.addTask(title: "Estudar Swift na DIO")

taskList.listTasks()

taskList.completeTask(index: 0)


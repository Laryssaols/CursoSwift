import Foundation

enum TaskStatus {
    case completed
    case incomplete
}

struct Task {
    let title: String
    var status: TaskStatus
}

class TaskList {
    var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title, status: .incomplete)
        tasks.append(newTask)
    }

    func listTasks() {
        for (index, task) in tasks.enumerated() {
            let statusString = task.status == .incomplete ? "Incomplete" : "Completed"
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

let taskList = TaskList()

taskList.addTask(title: "Fazer o projeto de POO em swift")
taskList.addTask(title: "Estudar Swift na DIO")

taskList.listTasks()

taskList.performConcurrentOperation {
    taskList.completeTask(index: 0)
}

taskList.listTasks()

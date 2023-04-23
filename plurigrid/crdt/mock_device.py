class MockDevice:
    def __init__(self, crdt):
        self.crdt = crdt

    def process_event(self, event):
        action, *args = event
        if action == "insert_node":
            self.crdt.insert_node(*args)

    def export_chart(self):
        return self.crdt.export_chart()

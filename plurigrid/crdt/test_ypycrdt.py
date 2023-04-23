import pytest
from ypy import ybrid
from mock_device import MockDevice


def simulate_collaboration(device1, device2, events):
    for event in events:
        device1.process_event(event)
        device2.process_event(event)


def test_crdt_mermaid_chart_collaboration():
    # Two developers starting a company while creating a mermaid chart
    alice = ybrid()
    bob = ybrid()

    device_alice = MockDevice(alice)
    device_bob = MockDevice(bob)

    # Commented tuples indicate the actions performed by Alice and Bob respectively
    actions = [
        ("insert_node", "A", "Start", "TD", None),
        ("insert_node", "B", "Idea", "TD", "A"),
        ("insert_node", "C", "Market Research", "TD", "B"),
        ("insert_node", "D", "Business Plan", "TD", "C"),
        ("insert_node", "E", "Funding", "TD", "D"),
        ("insert_node", "F", "Product Development", "TD", "E"),
        ("insert_node", "G", "Marketing", "TD", "F"),
        ("insert_node", "H", "Sales", "TD", "G"),
        ("insert_node", "I", "Profitable?", "DT", "H"),
        ("insert_node", "J", "End", "TD", "I"),
        ("insert_node", "K", "Adjust Strategy", "TD", "I"),
    ]

    simulate_collaboration(device_alice, device_bob, actions)

    # Checking if both devices have the same chart structure
    assert device_alice.export_chart() == device_bob.export_chart()

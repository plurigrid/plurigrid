from chatarena.agent import Player
from chatarena.backends import OpenAIChat
from chatarena.environments.conversation import Conversation
from chatarena.arena import Arena

environment_description = "In an electricity market with distributed energy resources (DERs), the goal is to efficiently manage the energy supply while minimizing costs and maximizing profits. Develop a three-level gameplay-based intelligent structure that addresses network and physical constraints, evaluates individual and collaborative strategies, and encourages the formation of coalitions among the participants. Consider the use of optimization algorithms, fuzzy logic, and cooperative game theory for effective collaboration."

agent1 = Player(
    name="Electric Vehicle Owner",
    backend=OpenAIChat(),
    role_desc="As the owner of an electric vehicle, your role in the intelligent grid structure is to minimize the cost of charging your vehicle. Collaborate with other DER participants like solar panel owners and battery owners to form a coalition that benefits all parties involved. Use your influence and strategic thinking to optimize the power usage of your vehicle, maximize profits, and contribute to the overall efficiency of the grid.",
    global_prompt=environment_description,
)

agent2 = Player(
    name="Solar Panel Owner",
    backend=OpenAIChat(),
    role_desc="As a solar panel owner, your responsibility is to maximize the revenue generated from selling solar energy to the grid. Engage with other participants like electric vehicle owners and battery owners to create cooperative strategies that benefit all parties involved. Leverage the power of the intelligent grid and optimization algorithms to find effective collaborative strategies, resulting in increased profits and energy efficiency.",
    global_prompt=environment_description,
)

agent3 = Player(
    name="Battery Owner",
    backend=OpenAIChat(),
    role_desc="As a solar panel owner, your responsibility is to maximize the revenue generated from selling solar energy to the grid. Engage with other participants like electric vehicle owners and battery owners to create cooperative strategies that benefit all parties involved. Leverage the power of the intelligent grid and optimization algorithms to find effective collaborative strategies, resulting in increased profits and energy efficiency.",
    global_prompt=environment_description,
)

env = Conversation(player_names=[p.name for p in [agent1, agent2, agent3]])
arena = Arena(
    players=[agent1, agent2, agent3], environment=env, global_prompt=environment_description
)

# arena.launch_cli()
arena.run(num_steps=10)
arena.save_history(path="./plurigrid/ontology/arena_history.json")

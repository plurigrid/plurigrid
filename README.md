# Getting started
`just play`
## More on open gameplay

1. If it's the first time running after pulling changes, run "just install" to install all dependencies.
2. Set the OPENAI_API_KEY environment variable in your shell.
3. Run `just shell` to run the nix and poetry shells.
4. For the play-coplay agent, run `just play {gradio, repl, zulip}`. Default mode if you don't provide one will create a link to a gradio UI. (for zulip see extra configuration below.)
5. To summon a twin with a prompt, run `just summon <prompt-file-path> {gradio, repl, zulip}`.
6. To start an ontology agent, run `just ontology <path-to-knowledge-base> {gradio, repl, zulip}`. This will allow you to ask questions over the knowledge base you provide. Protip: make sure the knowledge base does not have nested directories. scripts/copy_files_flat.sh can help with this.

Set up Docker and enable Rosetta in **Experimental Features**
```
docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash
nix-shell
cd /plurigrid
poetry update
poetry shell
python agent/agents/plurigrid.py
```

## Setup and Installation

1. Install [nix](https://nixos.org/download.html#nix-install-macos)

2. To test installation, run `echo $PATH` and ensure `{...}/.nix-profile/bin` is the first element; if not, try `export PATH=$HOME/.nix-profile/bin:$PATH`

3. Make sure you have the nix-pkgs channel set, ie.

```
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
```

[<img title="Français" alt="Français" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/fr.svg" width="22">](docs/README-fr.md)
[<img title="Portuguese" alt="Portuguese" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/br.svg" width="22">](docs/README-pt-br.md)
[<img title="Romanian" alt="Romanian" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/ro.svg" width="22">](docs/README-ro.md)
[<img title="Russian" alt="Russian" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/ru.svg" width="22">](docs/README-ru.md)
[<img title="Slovenian" alt="Slovenian" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/si.svg" width="22">](docs/README-si.md)
[<img title="Spanish" alt="Spanish" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/es.svg" width="22">](docs/README-es.md)
[<img title="Turkish" alt="Turkish" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/tr.svg" width="22">](docs/README-tr.md)
[<img title="Ukrainian" alt="Ukrainian" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/ua.svg" width="22">](docs/README-ua.md)
[<img title="简体中文" alt="Simplified Chinese" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/cn.svg" width="22">](docs/README-cn.md)
[<img title="繁體中文 (Traditional Chinese)" alt="繁體中文 (Traditional Chinese)" src="https://cdn.staticaly.com/gh/hjnilsson/country-flags/master/svg/tw.svg" width="22">](docs/README-zh-tw.md)

3. Zulip: If running a `zulip` agent, you will also need a Zulip config file. Go to Zulip and navigate to 'Settings' --> 'Personal Settings' --> 'Bots'. Download the zuliprc file and copy it to ~/zuliprc.

## Tips

- To exit the poetry shell, type `exit`
- To exit the nix shell, use `Ctrl + d`
- If you need to reinstantiate your env, do `poetry env list` and then paste the outputted env into `poetry env remove {env-name}`. Then, run `poetry install` and `poetry shell` again to instantiate a new env.

## Appendix

### Reproducibility

`nix` and `poetry` allow for [packaging for serverless execution](https://github.com/bananaml/serverless-template) with reliable system, package, and other application dependencies like Secrets correctly derived for individual `agent` runtime environment.

# Plurigrid: Protocol for Autopoietic Ergodicity in Decentralized Transactive Energy
keywords: sense-making, active inference doctrines, amplifying agency in networks, open games, joint states, generative models, correlated equilibria, polynomial morphology, anarchist anthropologyo, categorical cybernetics, temporal type theory
Check out our:
- [ontology](https://github.com/plurigrid/plurigrid)
- [microworlds](https://github.com/plurigrid/microworlds) (topoi, arena)
- [agent](https://github.com/plurigrid/agent)

The advancement of self-rebalancing electricity grid with renewables requires a balance between theoretical insights and practical considerations. In this paper, we propose a thermodynamic perspective on autopoietic ergodicity, emphasizing the principles of energy sovereignty and the role of theoretical computer science in identifying potential limitations and gaps in algorithmic construction and aggregation of social choice. By adhering to the principles of embodied gradualism, we aim to foster a more agentic view of the development of smart grids and our participation in them.

The development of an energy coordination commons must consider thermodynamics and energy efficiency. We explore strategies to optimize energy consumption, including novel algorithmic approaches and hardware advancements that minimize the environmental impact and ensure long-term sustainability.

## Autopoietic Ergodicity: A Foundation for Embodied Gradualism
We delve into the concept of autopoietic ergodicity, which combines the principles of autopoiesis (self-maintenance) and ergodicity (time and ensemble average equivalence) in interoperable systems. This foundation allows for the gradual, adaptive development of Plurigrid of Plurigrids while maintaining the principles of embodied intelligence.
## Open Games and Markov Category
### Play / Generative Channel
A generative channel, also known as a generative model or stochastic channel, is a mathematical construct that models the process of generating data or outcomes according to some specified underlying probability distribution. It captures the dependencies and relationships between variables, such as input features and output labels in a data-driven system or between players' strategies and outcomes in a game theory setting.

In the context of a Markov category, a generative channel can be represented as a morphism between objects, where objects capture the structure of probability spaces, and morphisms represent stochastic processes or conditional probability distributions. The composition of morphisms in a Markov category embodies the concept of sequential stochastic processes, where the output of one channel serves as the input for the next.

Generative channels are used to model a wide range of systems in various domains, including machine learning, statistics, and game theory. By analyzing the properties of these channels, one can draw inferences about the underlying processes, predict future outcomes, or optimize the design of a system. In the context of game theory, generative channels can be used to model the dependencies between player strategies, game states, and payoffs, allowing for a deeper understanding of the dynamics of strategic interactions in a game.
### Co-Play / Recognition Channel
A recognition channel, also referred to as a recognition model or inference model, is a mathematical construct used to model the process of inferring or estimating the underlying latent variables or parameters from observed data or outcomes. It captures the probabilistic relationship between the observed variables and the latent variables and serves as the inverse of a generative channel or generative model.

In the context of a Markov category, a recognition channel can be represented as a morphism between objects, where objects capture the structure of probability spaces, and morphisms represent stochastic processes or conditional probability distributions. The composition of morphisms in a Markov category embodies the concept of sequential stochastic processes, where the output of one channel serves as the input for the next.

Recognition channels play a significant role in various fields, including machine learning, statistics, and game theory. In machine learning, recognition channels are often used for variational inference and learning, where the goal is to approximate an intractable posterior distribution of latent variables given observations. In game theory, recognition channels can be employed to model the players' beliefs about other players' strategies based on observed actions, which can be useful in understanding and predicting the behavior of players in strategic interactions.
### Learning
Together with generative channels, recognition channels form an essential part of the learning and inference process. They enable a systematic translation and understanding of the relationships between observable data and hidden variables or parameters that govern the underlying processes in a system.
## Background detour 🐇🕳️
Markov Categories provide a compositional framework for studying probability theory and are particularly well-suited for modeling systems where probability distributions and stochastic processes play a key role. In this work, we extend the open games framework for compositional game theory to encompass both pure and mixed strategies, leveraging the expressive power of Markov Categories and their rich structure.

Central to our approach is the development of generative models for games, which are represented as morphisms in a Markov Category. These models encapsulate the joint distribution of states and strategies for a game and allow us to reason about the dependencies between player strategies, game states, and outcomes.

First, we consider the case of pure strategies, constructing a Markov category GPure whose morphisms are open games with pure strategies. This category captures the essence of the traditional combinatorial game theory, wherein players sequentially and deterministically choose strategies.

To incorporate mixed strategies, we extend GPure to a Markov category GProb, where morphisms are probabilistic open games that allow players to choose strategies according to probability distributions. The discrete probability distribution monad is used to model these mixed strategies and derive generative models for the joint distribution of strategies and states in the game.

We define functors P : GPure → GProb and U : GProb → GPure to relate pure and probabilistic open games. The functor P takes a pure open game and adds probabilistic strategies while preserving the original play and coutility functions. Conversely, U restricts a probabilistic open game to deterministic strategies by considering only Dirac distributions on strategy sets.

The categories GPure and GProb are connected by an adjunction between the functors P and U, providing a bridge between pure and probabilistic open games. This adjunction allows us to transfer concepts and constructions between the two categories and analyze games where both pure and mixed strategies are present.

In conclusion, the framework of Markov Categories offers a natural and powerful language for exploring compositional game theory with both pure and mixed strategies. By constructing generative models for games and leveraging the rich structure of Markov Categories, we gain deep insights into the interplay between players' strategies, game states, and outcomes, ultimately leading to a better understanding of the foundations of economic game theory.

## Partial Orderings and Value Alignment
We are told our systems should be designed with value alignment in mind to ensure that their objectives align with human values and societal goals. One approach to tackle this challenge is to leverage partial orderings that stem from value elicitation processes. In this section, we provide a rigorous treatment of partial orderings and their potential applications in aligned manufacturing of consent for further Plurigrid development.

Mathematically, a partial order $\preceq$ is a binary relation over a set $V$ that satisfies the following properties for any $v_1, v_2, v_3 \in V$:

- Reflexivity: $v_1 \preceq v_1$
- Antisymmetry: If $v_1 \preceq v_2$ and $v_2 \preceq v_1$, then $v_1 = v_2$
- Transitivity: If $v_1 \preceq v_2$ and $v_2 \preceq v_3$, then $v_1 \preceq v_3$

Not all elements in $V$ need to be comparable, meaning that it is possible that neither $v_1 \preceq v_2$ nor $v_2 \preceq v_1$ holds for some $v_1, v_2 \in V$. This property is key when dealing with complex value systems, as it allows us to represent conflicting or incomparable values without attempting to force a total ordering.

To apply partial orderings in the context of Plurigrid development, we can extract preference relations from human stakeholders through value elicitation processes. Once we have gathered these preference relations, we can use them to build a partial order over a set of values that influence the behavior of the system and through it, the system of systems. Preserving the agency of individuals in that their partial orderings can be interrogated via the [provably deductive assurance cases](https://leanprover-community.github.io/lt2021/slides/logan-LeanAssurance.pdf). This can be done by calculating the probability of preference between any two values, $P(v_1 \preceq v_2)$, where $v_1, v_2 \in V$. The resulting probabilities can be used to guide the Plurigrid system's (concretely, the tractable aggregationo of each agent in multi-agent setting) decision-making process while maintaining reflexivity, antisymmetry, and transitivity.

One challenge in applying partial orderings to Plurigrid systems at multiple scales is handling the potential inconsistency and incompleteness of preference relations elicited from humans, as well as the principal agent problem for any intermediaries not already using Plurigrid Protocol. In practice, we may need to develop algorithms that can learn and adapt to evolving partial orders over time, accommodating the dynamism of human values and preferences. Reinforcement learning (RL) and Bayesian methods are promising avenues for developing such algorithms, as they allow Plurigrids to update their decision-making strategies based on observed data and feedback. We posit that Temporal Type Theory may well end up being the sense-making, time-binding formalism we need.

By incorporating partial orderings into Plurigrid decentralized expansion planning and mathematical unit commitment coordination, we can better align Plurigrid systems with human values, while acknowledging the complexity and dynamism of human preferences. This approach allows for more robust and adaptable Plurigrid that can navigate the challenges of value alignment in a diverse and evolving world.

To overcome the aforementioned challenges, we suggest a principled approach that incorporates the combined anarchist categorical cybernetics principles _and_ privacy / interoperability in practice, to guide Plurigrid's development and growth. The following steps outline a strategic plan that can help Plurigrid succeed despite the numerous obstacles, challenges, and hurdles.

**Leveraging Plurigrid Protocol for optimization and coordination.** Utilize representational learning systems to develop and implement sophisticated optimization and coordination strategies that maximize the efficiency, stability, and scalability of Plurigrid's decentralized energy protocol. This may include the application of reinforcement learning, compositional game theory, compositional active inference and other advanced techniques to improve decision-making and resource allocation.

**Collaboration with stakeholders.** Foster partnerships with key stakeholders in the energy sector, including regulators, utilities, technology providers, and consumers. Open and transparent collaboration will be crucial to drive necessary policy changes, encourage investment, and promote widespread adoption of decentralized energy solutions.

**Education and awareness campaigns.** Develop and implement targeted education and awareness campaigns to help consumers and communities understand the benefits of decentralized energy systems. By highlighting the potential for increased efficiency, sustainability, and empowerment, Plurigrid can build trust and support for its innovative approach.

**Iterative and adaptive development.** Adopt an iterative and adaptive development process that enables Plurigrid to learn from real-world interactions and continuously refine its decentralized energy protocol. This approach, rooted in embodied gradualism and autopoietic ergodicity, allows the system to adapt to changing conditions and user preferences, ensuring its long-term viability and resilience.

**Embracing the Open Agencies Framework and Cyborgism Manifesto.** Align Plurigrid's development and growth with the principles of the Open Agencies Framework and Cyborgism Manifesto. By positioning coalitions of e-gens in Plurigrids as partners in the development of decentralized energy solutions, Plurigrid can foster a more equitable and diverse energy future that benefits all stakeholders.

**Ethical and responsible uses of AI.** Ensure that any systems used in Plurigrid's development adhere to ethical principles and responsible AI guidelines, e.g. [Constitutional AI](https://arxiv.org/abs/2212.08073). This includes transparency, fairness, accountability, and privacy protection, which are critical in fostering trust and acceptance among users and communities.

By adopting these principles and strategies, Plurigrid can overcome the numerous challenges it faces and succeed in its mission to transform the energy sector. Through its innovative, decentralized approach, Plurigrid stands to succeed.

# Credit
- [Task-Driven Autonomous Agent](https://twitter.com/yoheinakajima/status/1640934493489070080?s=20) shared on Twitter (2023-03-28)
- [Compositional Active Inference](https://youtu.be/CoVKGFH6wRQ) given at Topos Institute (2022)
- [Compositional Game Theory with Mixed Strategies: Probabilistic Open Games Using a Distributive Law](https://arxiv.org/abs/2009.06831)
>>>>>>> main

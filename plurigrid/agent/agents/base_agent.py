from abc import ABC, abstractmethod
from plurigrid.agent.utils import gradio, repl, zulip
from plurigrid.agent.utils import discord

class BaseAgent(ABC):
    def __init__(self, config, mode):
        self.mode = mode
        if mode == "zulip":
            self.client = zulip.ZulipClient(self.handle_input)
        elif mode == "discord":
            self.client = discord.DiscordClient(self.handle_input)
        elif mode == "repl":
            self.client = repl.Repl(self.handle_input)
        elif mode == "gradio":
            self.client = gradio.Gradio(self.handle_input)
        else:
            raise ValueError("Invalid agent mode")

    def run(self):
        self.client.run()

    ## Returns LLM output given an input message
    @abstractmethod
    def handle_input(self, msg):
        pass

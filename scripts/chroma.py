import logging
import sys
from llama_index import GPTChromaIndex, SimpleDirectoryReader

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
logging.getLogger().addHandler(logging.StreamHandler(stream=sys.stdout))
import chromadb
from chromadb.config import Settings

chroma_client = chromadb.Client(Settings(chroma_db_impl="duckdb+parquet"), persist_directory="ontology")
chroma_collection = chroma_client.create_collection("ontology")

ontology = SimpleDirectoryReader('ontology').load_data()
index = GPTChromaIndex.from_documents(ontology, chroma_collection=chroma_collection)

response = index.query("What is Plurigrid?")
print(response)

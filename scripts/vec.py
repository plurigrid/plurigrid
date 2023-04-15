from llama_index import GPTSimpleVectorIndex, SimpleDirectoryReader
from llama_index.node_parser import SimpleNodeParser

parser = SimpleNodeParser()

gm = SimpleDirectoryReader('ontology').load_data()
gn = parser.get_nodes_from_documents(gm)

vec = GPTSimpleVectorIndex(gn)
vec.save_to_disk("ontology/vec.json")

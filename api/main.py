from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    name: str
    description: str = None
    price: float
    quantity: int

# In-memory storage
items = {}

@app.get("/items/{item_id}")
async def read_item(item_id: str):
    return items.get(item_id)

@app.post("/items/")
async def create_item(item_id: str, item: Item):
    if item_id in items:
        return {"Error": "Item already exists"}
    items[item_id] = item
    return items[item_id]

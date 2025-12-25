from fastapi import FastAPI
import os

app = FastAPI(title="AWS Production Platform")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/")
def root():
    return {
        "service": "aws-production-platform",
        "environment": os.getenv("ENV", "local")
    }

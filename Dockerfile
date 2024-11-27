# Use an official Python runtime as a parent image
FROM python:3.11-slim
USER root

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .
# Expose the FAISS index storage directory to persist the data
RUN mkdir -p /app/faiss_index

EXPOSE 8501

# Command to run your application
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

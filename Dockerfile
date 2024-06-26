# Use the official Python 3.9 image
FROM python:3.9

# Set the working directory to /code
WORKDIR /code

# Copy the current directory contents in the container at /code
COPY . /code

# Install the requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Set up a new user named "user"
RUN useradd -m user

# Change ownership of /code directory to the new user
RUN chown -R user:user /code

# Switch to the "user" user
USER user

# Set home to the user's home directory
ENV HOME=/home/user

# Expose port (if needed, e.g., 8000 for FastAPI/uvicorn)
EXPOSE 7860

# Command to run the application (example for FastAPI with uvicorn)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]

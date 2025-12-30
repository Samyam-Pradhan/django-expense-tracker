FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

# Install all the Python packages my project needs, listed in requirements.txt, and don’t save extra cache files so the image stays smaller.
RUN pip install --no-cache-dir -r requirements.txt 

COPY expense_tracker/ .  

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

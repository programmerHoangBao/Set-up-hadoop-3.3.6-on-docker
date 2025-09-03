# Set-up-hadoop-3.3.6-on-docker
## **1. Prerequisite**
- Has at least 8GB of RAM.
- Docker version > 28.1.1 and Docker Compose > 2.35.1 have been installed.

## **2. Set up**
### **2.1. Clone the code and set up Hadoop 3.3.6 on your machine.**
- Open the terminal at the location where you want to save the project and run the following command.<br>
  **git clone https://github.com/programmerHoangBao/Set-up-hadoop-3.3.6-on-docker.git** <br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/11401d91-d77e-42b1-b6d6-67b0d36c22f6" /><br>
### **2.2. Set up**
- Navigate to the Set-up-hadoop-3.3.6-on-docker directory.<br>
  **cd Set-up-hadoop-3.3.6-on-docker** <br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/009123b7-426c-46cc-87d2-d670a16f06c7" /><br>
- Start all services defined in the docker-compose.yml file and run them in detached mode.<br>
  **docker-compose up -d** <br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/202e9094-5854-44c3-a644-ac11cd84367e" /><br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/18222215-d148-4015-ae2e-7210d9f5062c" /><br>
- Format the HDFS NameNode inside the Docker container.<br>
  **docker-compose run namenode hdfs namenode -format**<br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/1c9b8d1a-2da5-441d-853d-c045ff026334" /><br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/0880829d-fe96-4c7d-9895-e22f998bc079" /><br>
## **3. Result**
- Result on doker:<br>
<img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/2b47be4e-772d-44f5-90f7-fff5883ff4be" /><br>
- Access the website at http://localhost:9870/dfshealth.html#tab-overview.<br>
<img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/66e84a06-963a-4520-9478-7589a1aa9c62" /><br>
- Check namenode.<br>
  **docker exec -it namenode bash**<br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/ef56fab3-7bdb-4c6c-8cc5-59b703be0883" /><br>
- Check datanode.<br>
  **docker exec -it datanode bash** <br>
  <img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/f3e9e22c-a3a3-4b4d-a3d3-ece3c228f4ac" /><br>





   
  

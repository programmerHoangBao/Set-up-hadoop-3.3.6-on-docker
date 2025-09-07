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
   **docker ps** <br>
<img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/3a2d32ea-b4ae-40dc-8fad-4f38b30ce065" />
<img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/102e652d-ea51-4be4-94ec-125758f1fbab" />
**- Check namenode.<br>**
  http://localhost:9870/dfshealth.html#tab-overview <br>
  <img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/bdeaf2a8-e265-4938-8432-da5ee2b76b6b" />
**- Check datanode.<br>**
   http://localhost:9864/datanode.html <br>
  <img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/a2b6b00a-e1bc-4307-9e78-d0878ca45aa3" />
**- Check resourcemanager: <br>**
   http://localhost:8088/cluster <br>
   <img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/3f7ba0df-0647-40e4-a3ee-841b5685b7b5" />
**- Check node:**
  http://localhost:8042/node <br>
  <img width="2560" height="1528" alt="image" src="https://github.com/user-attachments/assets/08c4e45c-c721-4fce-9be0-c7f7b8c0dc97" />







   
  

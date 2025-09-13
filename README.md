# PySpark-Practical
This practical is intended for IndabaX Eswatini 2025 and we're learning how to download, setup, install and run Apache Hadoop and Spark through the PySpark API.

---

# **Comprehensive Installation Guide: WSL + Ubuntu + Apache + Hadoop 3.4.2 + PySpark**

This guide will help you set up a **single-node Hadoop environment with PySpark** on Windows using WSL and Ubuntu. It includes Apache installation, Hadoop configuration, Java setup, and running PySpark in a virtual environment with Jupyter Notebook.

---

## **Step 1: Install WSL and Ubuntu**

1. Open **PowerShell as Administrator** and run:

```powershell
wsl --install
```
This installs the default WSL version (usually WSL2) and Ubuntu.

2. Restart your PC if prompted.
3. Open **Ubuntu** from the Start menu and create a Linux user.
4. Update Ubuntu packages:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## **Step 2: Install Apache Web Server (Optional)**

If you want Apache HTTP Server:

```bash
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2
```

* Test by opening `http://localhost` in a browser.

---

## **Step 3: Install Java 17**

Hadoop 3.4.2 requires **Java 17**:

```bash
sudo apt install -y openjdk-17-jdk wget tar ssh
java -version
```

Set `JAVA_HOME` system-wide:

```bash
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

---

## **Step 4: Install Hadoop 3.4.2**

1. Download Hadoop:

```bash
wget https://downloads.apache.org/hadoop/common/hadoop-3.4.2/hadoop-3.4.2.tar.gz
```

2. Extract and move:

```bash
tar -xvzf hadoop-3.4.2.tar.gz
sudo mv hadoop-3.4.2 /usr/local/hadoop
```

3. Set Hadoop environment variables in `~/.bashrc`:

```bash
nano ~/.bashrc
```

Add:

```bash
# Hadoop Environment
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
```

Reload bash:

```bash
source ~/.bashrc
```

---

### **Step 4a: Configure Hadoop Files**

1. **hadoop-env.sh**

```bash
nano $HADOOP_HOME/etc/hadoop/hadoop-env.sh
```

Set:

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
```

2. **core-site.xml**

```bash
nano $HADOOP_HOME/etc/hadoop/core-site.xml
```

```xml
<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://localhost:9000</value>
  </property>
</configuration>
```

3. **hdfs-site.xml**

```bash
nano $HADOOP_HOME/etc/hadoop/hdfs-site.xml
```

```xml
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
  <property>
    <name>dfs.name.dir</name>
    <value>file:///usr/local/hadoop/hadoop_data/hdfs/namenode</value>
  </property>
  <property>
    <name>dfs.data.dir</name>
    <value>file:///usr/local/hadoop/hadoop_data/hdfs/datanode</value>
  </property>
</configuration>
```

4. **mapred-site.xml**

```bash
cp $HADOOP_HOME/etc/hadoop/mapred-site.xml.template $HADOOP_HOME/etc/hadoop/mapred-site.xml
nano $HADOOP_HOME/etc/hadoop/mapred-site.xml
```

```xml
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>
```

5. **yarn-site.xml**

```bash
nano $HADOOP_HOME/etc/hadoop/yarn-site.xml
```

```xml
<configuration>
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
</configuration>
```

---

### **Step 4b: Format HDFS**

```bash
hdfs namenode -format
```

---

### **Step 4c: Start Hadoop**

```bash
start-dfs.sh
start-yarn.sh
```

Check daemons:

```bash
jps
```

You should see: `NameNode`, `DataNode`, `ResourceManager`, `NodeManager`.

Access UIs:

* HDFS NameNode → [http://localhost:9870](http://localhost:9870)
* YARN ResourceManager → [http://localhost:8088](http://localhost:8088)

---

## **Step 5: Install Python & PySpark**

1. Install Python 3 and venv:

```bash
sudo apt install -y python3 python3-pip python3-venv
```

2. Create a virtual environment inside Hadoop folder:

```bash
cd /usr/local/hadoop
python3 -m venv pyspark-env
```

3. Activate the virtual environment:

```bash
source pyspark-env/bin/activate
```

4. Install PySpark, Jupyter, and findspark:

```bash
pip install --upgrade pip
pip install pyspark notebook findspark
```

---

## **Step 6: Start Jupyter Notebook**

```bash
jupyter-notebook --no-browser --ip=0.0.0.0 --port=8888
```

* Copy the token URL from the terminal.
* Paste it in your **Windows browser** to open Jupyter Notebook.

---

## **Step 7: Run PySpark Code in Jupyter**

Create a new **Python 3 Notebook** and paste:

```python
from pyspark.sql import SparkSession

# Create Spark session
spark = SparkSession.builder \
    .appName("simpleapp") \
    .master("local[*]") \
    .getOrCreate()

# Sample data
data = [("Metfula", 25, "Eswatini"),
        ("Elliot", 28, "Zimbabwe"),
        ("Aina", 30, "Namibia")]

# Create DataFrame
df = spark.createDataFrame(data, ["Name", "Age", "Country"])

# Show data
df.show()
```

Expected output:

```
+-------+---+---------+
|   Name|Age|  Country|
+-------+---+---------+
|Metfula| 25| Eswatini|
| Elliot| 28| Zimbabwe|
|   Aina| 30|  Namibia|
+-------+---+---------+
```

---




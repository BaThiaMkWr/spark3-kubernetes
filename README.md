# Deploying Spark 3 on Kubernetes

Build the Docker image:

```sh
$ cd docker/
$ ./create.sh
```

Create the deployments and services:

```
$ ./create.sh # on the root directory
```

Check pods:

```
$ kubectl get pods -n spark
NAME                            READY   STATUS    RESTARTS   AGE
spark-master-7fd76d688-brtvh    1/1     Running   0          57m
spark-worker-5d7cf5cbdd-q7qbf   1/1     Running   0          57m
spark-worker-5d7cf5cbdd-tx7z2   1/1     Running   0          57m
```

Run the PySpark shell from the the master container

```
$ kubectl exec spark-master-7fd76d688-brtvh -n spark -it pyspark

```

Then run the following code after the PySpark prompt appears:

```
words = 'the quick brown fox jumps over the\
        lazy dog the quick brown fox jumps over the lazy dog'
sc = SparkContext()
seq = words.split()
data = sc.parallelize(seq)
counts = data.map(lambda word: (word, 1)).reduceByKey(lambda a, b: a + b).collect()
dict(counts)
sc.stop()
```

apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  name: got-analytics
  namespace: iris
spec:
  serviceName: got-analytics
  replicas: 1
  updateStrategy:
    type: RollingUpdate
  selector:
    matchLabels:
      app: got-analytics
  template:
    metadata:
      labels:
        app: got-analytics
    spec:

      initContainers:
      - name: got-volume-change-owner-hack
        image: busybox
        command:
        - sh
        - -c
        - |
          chown -R 51773:52773 /opt/got/got-DATA
          chmod g+w /opt/got/got-DATA
          echo -e "zn \"%sys\"\nif (##class(SYS.Database).%ExistsId(\"/opt/got/got-DATA\")) { halt }\nset db=##class(SYS.Database).%New()\nset db.Directory=\"/opt/got/got-DATA\"\nset db.ResourceName=\"%DB_got\"\nwrite db.%Save()\nhalt" > /mount-helper/mount_got_data
        volumeMounts:
        - mountPath: /opt/got/got-DATA
          name: got-volume
        - mountPath: /mount-helper
          name: mount-helper
      volumes:
      - emptyDir: {}
        name: mount-helper
      containers:
      - image: DOCKER_REPO_NAME:DOCKER_IMAGE_TAG
        name: got-analytics
        lifecycle:
          postStart:
            exec:
              command:
              - /bin/bash
              - -c
              - |
                sleep 30
                iris session iris < /mount-helper/mount_got_data
        ports:
        - containerPort: 52773
          name: web
        volumeMounts:
        - mountPath: /opt/got/got-DATA
          name: got-volume
        - mountPath: /mount-helper
          name: mount-helper
  volumeClaimTemplates:
  - metadata:
      name: got-volume
      namespace: iris
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 10Gi

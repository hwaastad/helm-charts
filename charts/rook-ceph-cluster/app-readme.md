This chart creates a Ceph cluster using Rook (similar to Rook's cluster.yaml)

Ceph data is stored in this directory on all nodes: {{ .Values.cephDataDir }}

The Ceph pool name is: {{ .Values.rook.poolName }}

StorageClasses provided:

 Rados Block Device (volumes): {{ .Values.rbdStorageClassName }}
 Shared CephFS Filesystem: {{ .Values.fsStorageClassName }}, of size: {{ .Values.rook.cephfsPersistentVolumeSize }}

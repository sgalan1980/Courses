
$rg = "RG02"
$name = "akbnet01"
##### CONTAINER REGISTRY ##############

# Create a resource group $rg on a specific location $location (for example eastus) which will contain the Azure services we need 
$ az group create -l $location -n $rg
# Create an ACR registry $acr
$ az acr create -n $acr -g $rg -l $location --admin-enabled true

############# KUBERNETES CLUSTER ########################

# Setup of the AKS cluster
$ az aks create -n $name -g $rg --generate-ssh-keys -k 1.11.4 -c 1
# Once created (the creation could take ~10 min), get the credentials to interact with your AKS cluster
$ az aks get-credentials -n $name -g $rg
# Setup tiller for Helm, we will discuss about this tool later
$ kubectl create serviceaccount tiller --namespace kube-system
$ kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
# Setup the phippyandfriends namespace, you will deploy later some apps into it
$ kubectl create namespace phippyandfriends
$ kubectl create clusterrolebinding default-view --clusterrole=view --serviceaccount=phippyandfriends:default


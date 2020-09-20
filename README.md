# DownUnderCTF 2020 Infrastructure

CTFd on appengine flex setup so that you can get the sp00dy autoscaling.

1. Create a memorystore and cloud sql instances on google cloud and set up the connection information into the env vars
2. Create an account with an email provider such as mailgun or amazon ses, and set the details into the env vars
3. Make sure memorystore and cloudsql are on the same VPC, and change the setting under network.name to your VPC
4. Run the below command

```sh
gcloud app deploy
```

## Extras
You can place this setup behind a Google Cloud load balancer and CDN for caching of static files, which is what
we did in our setup.

```sh
# create the serverless network endpoint group (NEG)
gcloud beta compute network-endpoint-groups create ctfd-gae-neg --network-endpoint-type serverless \
    --app-engine-service=default --region australia-southeast1

# create the backend
gcloud beta compute backend-services add-backend ctfd-gae-backend \
    --global \
    --network-endpoint-group=ctfd-gae-neg \
    --network-endpoint-group-region=australia-southeast1
```

We then used the GUI to create our load balancer with the above backend. Check out https://cloud.google.com/iap/docs/load-balancer-howto
for more information.


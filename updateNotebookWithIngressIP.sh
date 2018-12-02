#!/bin/bash

INGRESS_IP=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

for file in $(dirname $0)/jupyter-notebooks/*.ipynb
do
  sed -i -e "s/%%INGRESS_IP%%/${INGRESS_IP}/g" $file
done

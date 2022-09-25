ENV ?= pretest
ifeq ($(ENV), production)
	ENV = production
else ifeq ($(ENV), staging)
	ENV = staging
endif

deploy:
	helm upgrade ipfs-ingress ./ingress --set env=$(ENV) --install --atomic

deploy-ipfs:
	helm upgrade ipfs ./ipfs --install --atomic

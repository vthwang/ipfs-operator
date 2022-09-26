ENV ?= pretest
ifeq ($(ENV), production)
	ENV = production
else ifeq ($(ENV), staging)
	ENV = staging
endif

deploy:
	helm upgrade ipfs ./ipfs --set env=$(ENV) --install --atomic

# Terraform - Infraestrutura Multi Ambiente

---

# 📘 *Sobre*:

 * Este projeto provisiona uma infraestrutura AWS para ambientes de **desenvolvimento**, **produção** e **staging;**

    

 * Cada ambiente possui uma **VPC** isolada, tamanhos específicos de **EC2**, Load Balancer, secret_arn e subnets públicas e privadas!

 ---

 ### 🔓  Requisitos:

- [x] Ter o **Terraform** instalado
    Caso não tenha, voCê pode baixa-lo por aqui: https://developer.hashicorp.com/terraform/install
- [X] Ter o **CLI** da **AWS** instalado
     Caso não tenha, voCê pode baixa-lo por aqui: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

# 🖥 Rodar

 * Rode **terraform init** para inicializar o **terraform** 

 * Configure sua **AWS** com **aws configure sso** para vincular ao terraform e repita o processo para criar os ambientes de dev, staging e prod com o CLI profile name

 * Após o **aws configure**, entre na pasta do ambiente que deseje rodar - Ex: cd enviroment/dev e exporte o AWS_PROFILE: **export AWS_PROFILE=dev**.

 * Logue no cli da AWS com aws sso login --profle dev

 * Com isso feito, você pode rodar o **terraform apply**, ou caso queira, pode rodar o <u> terraform plan </u> antes

 **Obs**: Se quiser rodar em outro ambiente, basta entrar na pasta dele e mudar o AWS_PROFILE. **Ex:** cd enviroment/prod ``bash: export AWS_PROFILE=prod`` 

---

# 📚 Funcionamento








---
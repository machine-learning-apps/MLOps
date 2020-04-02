# Machine Learning Ops

This repository provides examples, GitHub Actions and other tools that empower scientists and engineers to collaborate on novel and creative data products, in an effort to bring data science / machine learning workflows into parity with modern software development and infrastructure management.

## Background

As Machine Learning becomes more prevalent and ML models become intertwined with software applications, it is becoming increasingly clear that the process for developing and deploying these models is much more complex than a single application endpoint. The tools and processes applied to software development for the deployment of applications do not necessarily fit the Machine Learning deployment problem. This lead to the creation of this repository and the tools released by this group and the surrounding community.

Machine Learning Ops or ML Ops, is the term we are using to describe the tools and processes that the community has developed to solve the problems that are identified with our current practices and workflows.

## Objective

The objective of this community is to bring together as many leaders of open source and industry to develop open source standards, guidelines and tools that can be developed and maintained by the community at large and benefit anyone, from newbie to pro, in developing data science and machine learning solutions. 

## GitHub Actions

GitHub Actions are modular units of code that can be used in a `.github/workflow` yaml file. For more information around GitHub Actions checkout the [documentation](https://help.github.com/en/actions) and resources on GitHub.  

Machine Learning Apps maintains a few actions, but more importantly, maintains a list of actions developed by the community that help with ML Ops. These can be found [here](https://github.com/machine-learning-apps/MLOps/blob/master/src/actions.csv).

### Contributing an Action

If you have made a ML Ops action, please open a PR request modifying this file with your actions name, a link to the yaml file and a link to the action listed on the marketplace. If you would like a custom icon, please include that as well.

#### example:

| action-name | action-yaml-file | marketplace-link | icon |
| ----------- | ----------- | ----------- | ----------- |
| azure/aml-run | https://github.com/machine-learning-apps/actions-argo/blob/master/action.yaml | https://github.com/marketplace/actions/submit-argo-workflows-from-github | |

## GitHub Templates

Templates provide implementation details for users to easily get started using your actions, compute infrastructure etc. Machine Learning Apps maintains a few of these, but similarly to the actions, we maintain a list of [helpful templates](https://github.com/machine-learning-apps/MLOps/blob/master/src/templates.csv).


## Contributing

For contributing see the [contributor guidelines](https://github.com/machine-learning-apps/MLOps/blob/master/contributing.md)

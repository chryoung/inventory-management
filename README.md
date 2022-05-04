# Inventory Management

A mobile-friendly simple inventory management system for your home stock

## Features

- Manage products with variants
- Easily find out expired or out-of-stock products
- Consuming history management

## Requirement

- Ruby 3.1.1
- Rails 7

## Usage

### Run in development

```bash
rails db:migrate
bin/dev
```

### Run tests

```bash
RAILS_ENV=test rails assets:precompile
rails test
RAILS_ENV=test rails assets:clobber
```

## Screenshots

### Inventories desktop

![Inventories desktop](doc/static/inventories.png)

### Dashboard mobile

<img src="https://github.com/chryoung/inventory-management/raw/master/doc/static/dashboard-mobile.png" width="35%" alt="Dashboard mobile" />

### Inventories mobile

<img src="https://github.com/chryoung/inventory-management/raw/master/doc/static/inventories-mobile.png" width="35%" alt="Inventories mobile" />

### Item view mobile

<img src="https://github.com/chryoung/inventory-management/raw/master/doc/static/item-show-mobile.png" width="35%" alt="Item view mobile" />

### New inventory mobile

<img src="https://github.com/chryoung/inventory-management/raw/master/doc/static/new-inventories-mobile.png" width="35%" alt="New inventory mobile" />

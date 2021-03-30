# D9 Test Env
Lando-powered environment for running and developing Drupal 9 tests

## Usage:

1. Install Lando
2. Edit .lando.yml, set a unique "name", save.
3. Edit init.sh, set the desired Drupal core branch to checkout, e.g. "9.2.x", save.
4. Run:
```
./init.sh
```
5. To get the url for the local site, run:
```
lando info
```

### Tools

1. Drush:
```
lando drush st
```
2. Composer:
```
lando composer install
```

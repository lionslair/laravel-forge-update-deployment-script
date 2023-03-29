# Laravel Forge GitHub Action To Update Deployment Script

Update your [Laravel Forge](https://forge.laravel.com) Deployment script with GitHub Actions.

## Credit

Heavily based on [jbrooksuk/laravel-forge-action](https://github.com/jbrooksuk/laravel-forge-action)

## Inputs

It is highly recommended that you store all inputs using [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets).

| Input         | Description                                                                                                                                                                                                             |
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|                                                                            |
| `api_key`     | If you want to use the API to deploy your application, you must provide `api_key`, `server_id` and `site_id`.<br><br>You can generate an API key in your [Forge dashboard](https://forge.laravel.com/user-profile/api). |
| `server_id`   | You can find the ID of the server in the server's detail panel.                                                                                                                                                         |
| `site_id`     | You can find the ID of the site in the site's detail panel.                                                                                                                                                             |

## Examples

### Update 

```yml
name: 'Deploy on push'

on:
  push:
    branches:
      - master

jobs:
  forge-deploy:
    name: 'Laravel Forge Deploy'
    runs-on: ubuntu-latest

    steps:
      # Trigger Laravel Forge Deploy
      - name: Deploy
        uses: jbrooksuk/laravel-forge-action@v1.0.2
        with:
          api_key: ${{ secrets.API_KEY }}
          server_id: ${{ secrets.SERVER_ID }}
          site_id: ${{ secrets.SITE_ID }}
```

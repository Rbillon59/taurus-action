# Taurus action for Github action

This action will run a taurus container to launch a performance test following the Taurus yaml file provided.
You can setup threshold inside the taurus yaml so the exit code of this action will reflect the taurus test status

## Inputs

### `taurus_project_folder_name`

**Required** The name of the folder containing the taurus scenario and datas.  
The repo architecture should be like this :

```sh
+-- repo_code
+-- my-scenario 
    +-- dataset.csv
    +-- my-scenario.yaml
```

### `taurus_command_line`

**Required** The command line to append to the `bzt` command. Use space as separator

### `blazemeter_api_token`

**Optionnal** The blazemeter api token used to upload taurus report to the Blazemeter saas solution. Don't forget to add `-report` to the command line  
Also, this enable the cloud provisioning inside taurus, which you can use inside to your taurus file with "provisioning: cloud". It will provision cloud instances to run your performance test instead of the github runner


## Example usage

```yaml
uses: actions/taurus-action@v1
with:
  taurus_project_folder_name: 'my-scenario'
  taurus_command_line: my-scenario.yaml -report
  blazemeter_api_token: ${{ secrets.blazemeter-token }}
```
# docker-docker-registry-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['docker-docker-registry']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### docker-docker-registry::default

Include `docker-docker-registry` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[docker-docker-registry::default]"
  ]
}
```

## License and Authors

Author:: Daniel Ku (<kjunine@gmail.com>)

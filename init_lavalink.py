import os
import re
import yaml

pattern = re.compile(r"\$\{(\w+)\}")
loader = yaml.SafeLoader
tag = "!env"


def parse_env_yaml(loader, node):
    value = loader.construct_scalar(node)
    match = pattern.findall(value)
    if match:
        new_value = ""
        for g in match:
            new_value = value.replace(f"${{{g}}}", os.environ[g])
        return new_value
    return value


loader.add_constructor(tag, parse_env_yaml)

with open("lavalink.yml", "r") as template:
    settings = yaml.load(template, loader)

with open("application.yml", "w") as file:
    yaml.dump(settings, file, default_flow_style=False)

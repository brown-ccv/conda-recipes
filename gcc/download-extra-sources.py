import os
from conda_build import config
from conda_build import source
from conda_build.metadata import MetaData

class Source:
    def __init__(self, section):
        self.section = section
    def get_section(self, key):
        return self.section[key]

def main():
    metadata = MetaData(os.environ["RECIPE_DIR"])
    build_id = os.getcwd().split(os.path.sep)[-3]
    print "build_id:", build_id
    for name, section in metadata.get_section("extra").items():
        source.provide(
            Source(section),
            config.Config(build_id=build_id))

if __name__ == "__main__":
    main()

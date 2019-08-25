from tempfile import mkdtemp
from os import makedirs, environ
from os.path import isdir, exists, abspath, dirname, realpath
from shutil import copytree, rmtree
from contextlib import contextmanager

@contextmanager
def copy_of_directory(src, dst=None):
    if not dst:
        dst = mkdtemp(prefix='ocrd-test-tempdir-')
    if isdir(dst):
        rmtree(dst)
    if not isdir(dirname(dst)):
        makedirs(dirname(dst))
    copytree(src, dst)
    yield dst
    rmtree(dst)


class Assets():
    """
    Access test assets in OCR-D/assets
    """

    def __init__(self, baseurl=None):
        self.baseurl = baseurl

    def url_of(self, path, baseurl=None):
        """
        Get the URL of an asset
        """
        if baseurl is None:
            baseurl = self.baseurl
        return self.baseurl + path

    def path_to(self, path, baseurl=None):
        return self.url_of(path, baseurl)

if 'OCRD_BASEURL' in environ:
    assets = Assets(environ['OCRD_BASEURL'])
else:
    assets = Assets(dirname(realpath(__file__)) + '/')

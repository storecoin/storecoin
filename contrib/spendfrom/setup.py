from distutils.core import setup
setup(name='STOCspendfrom',
      version='1.0',
      description='Command-line utility for storecoin "coin control"',
      author='Gavin Andresen',
      author_email='gavin@storecoinfoundation.org',
      requires=['jsonrpc'],
      scripts=['spendfrom.py'],
      )
